part of '../weather_screen.dart';

class _ContentStateView extends StatelessWidget {
  const _ContentStateView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
          buildWhen: (previous, current) =>
              previous.searchText != current.searchText,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: uikit.SearchInputField(
                label: context.tr.weather.search,
                onChanged: (value) => context.read<CheckWeatherBloc>().add(
                  SearchCityEvent(value),
                ),
              ),
            );
          },
        ),
        BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
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
                return _ErrorStateView(error);
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
                      context.read<CheckWeatherBloc>().add(
                        GetWeatherEvent(cityName: model.name),
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
