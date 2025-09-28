part of '../weather_screen.dart';

class _ContentStateView extends StatelessWidget {
  const _ContentStateView(this.bloc);

  final CheckWeatherBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
          bloc: bloc,
          buildWhen: (previous, current) =>
              previous.searchText != current.searchText,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: uikit.SearchInputField(
                label: context.tr.weather.search,
                onChanged: (value) => bloc.add(SearchCityEvent(value)),
              ),
            );
          },
        ),
        BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
          bloc: bloc,
          buildWhen: (previous, current) => previous.weather != current.weather,
          builder: (context, state) {
            final weather = state.weather;
            if (weather == null) return const SizedBox.shrink();

            return Column(
              children: [
                const SizedBox(height: 8),
                Text(
                  '${weather.temp}°C',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        Expanded(
          child: BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
            bloc: bloc,
            buildWhen: (previous, current) =>
                previous.error != current.error ||
                previous.isLoading != current.isLoading ||
                previous.citiesList != current.citiesList,
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final error = state.error;
              if (error != null) {
                return _ErrorStateView(error, bloc);
              }

              final citiesList = state.citiesList;
              if (citiesList.isEmpty) {
                return Center(child: Text(context.tr.weather.noCitiesFound));
              }

              return ListView.builder(
                itemCount: citiesList.length,
                itemBuilder: (_, index) {
                  final model = citiesList[index];
                  return ListTile(
                    title: Text(
                      model.name,
                      style: context.titleTextStyle.title2,
                    ),
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      bloc.add(
                        GetWeatherEvent(
                          cityName: model.name,
                          lat: model.lat,
                          long: model.long,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
