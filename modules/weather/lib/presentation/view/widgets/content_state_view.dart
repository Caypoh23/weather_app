part of '../weather_screen.dart';

class _ContentStateView extends StatelessWidget {
  const _ContentStateView(this.bloc);

  final CheckWeatherBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.surfaceColors.primary,
            boxShadow: [
              BoxShadow(
                color: context.surfaceColors.dark.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
            bloc: bloc,
            buildWhen: (previous, current) =>
                previous.searchText != current.searchText,
            builder: (context, state) {
              return uikit.SearchInputField(
                label: context.tr.weather.search,
                onChanged: (value) => bloc.add(SearchCityEvent(value)),
              );
            },
          ),
        ),

        // Weather Display Section
        BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
          bloc: bloc,
          buildWhen: (previous, current) => previous.weather != current.weather,
          builder: (context, state) {
            final weather = state.weather;
            if (weather == null) return const SizedBox.shrink();

            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.brandColors.superApp.primary.withValues(alpha: 0.1),
                    context.brandColors.superApp.secondary.withValues(
                      alpha: 0.05,
                    ),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.brandColors.superApp.primary.withValues(
                    alpha: 0.2,
                  ),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  uikit.TitleWidget(
                    title: '${weather.temp.toStringAsFixed(1)}°C',
                    subtitle: context.tr.weather.weather,
                    size: uikit.TitleWidgetSize.large,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: context.brandColors.superApp.primary.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      context.tr.weather.weather,
                      style: context.baseTextStyle.base2.copyWith(
                        color: context.brandColors.superApp.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // Content Section
        Expanded(
          child: BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
            bloc: bloc,
            buildWhen: (previous, current) =>
                previous.error != current.error ||
                previous.isLoading != current.isLoading ||
                previous.citiesList != current.citiesList,
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: uikit.LoadingIndicator(size: 32, strokeWidth: 3),
                );
              }

              final error = state.error;
              if (error != null) {
                return _ErrorStateView(error, bloc);
              }

              final citiesList = state.citiesList;
              if (citiesList.isEmpty && state.searchText.isNotEmpty) {
                return uikit.EmptyState(
                  viewModelBuilder: (context) => uikit.EmptyStateModel(
                    title: context.tr.weather.noCitiesFound,
                    description: context.tr.shared.noResults,
                  ),
                );
              }

              if (citiesList.isEmpty && state.searchText.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.builder(
                itemCount: citiesList.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (_, index) {
                  final model = citiesList[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: context.surfaceColors.primary,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: context.borderColors.primary.withValues(
                          alpha: 0.1,
                        ),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
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
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: context.brandColors.superApp.primary
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.location_city,
                                  color: context.brandColors.superApp.primary,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.name,
                                      style: context.titleTextStyle.title3
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      context.tr.weather.search,
                                      style: context.baseTextStyle.base3
                                          .copyWith(
                                            color: context.textColors.secondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: context.textColors.tertiary,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
