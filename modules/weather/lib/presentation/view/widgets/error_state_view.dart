part of '../weather_screen.dart';

class _ErrorStateView extends StatelessWidget {
  const _ErrorStateView(this.error, this.bloc);

  final CheckWeatherBloc bloc;
  final CheckWeatherError error;

  @override
  Widget build(BuildContext context) {
    return switch (error) {
      CheckWeatherError.noConnection => uikit.EmptyState(
        viewModelBuilder: (context) => uikit.EmptyStateModel(
          title: context.tr.errors.noConnection,
          description: context.tr.shared.tryAgain,
          buttonText: context.tr.shared.retry,
          onButtonPressed: () => bloc.add(const RetryEvent()),
        ),
      ),
      CheckWeatherError.serverError => uikit.EmptyState(
        viewModelBuilder: (context) => uikit.EmptyStateModel(
          title: context.tr.errors.somethingWentWrong,
          description: context.tr.shared.tryAgain,
          buttonText: context.tr.shared.retry,
          onButtonPressed: () => bloc.add(const RetryEvent()),
        ),
      ),
      CheckWeatherError.serviceUnavailable => uikit.EmptyState(
        viewModelBuilder: (context) => uikit.EmptyStateModel(
          title: context.tr.errors.serviceUnavailable,
          description: context.tr.shared.tryAgainLater,
          buttonText: context.tr.shared.retry,
          onButtonPressed: () => bloc.add(const RetryEvent()),
        ),
      ),
    };
  }
}
