part of '../weather_screen.dart';

class _ErrorStateView extends StatelessWidget {
  const _ErrorStateView(this.error, this.bloc);

  final CheckWeatherBloc bloc;
  final CheckWeatherError error;

  @override
  Widget build(BuildContext context) {
    return switch (error) {
      CheckWeatherError.noConnection => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              context.tr.errors.noConnection,
              style: context.baseTextStyle.base1,
            ),
          ),
          const SizedBox(height: 12),
          uikit.Button(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => bloc.add(const RetryEvent()),
            text: context.tr.shared.retry,
          ),
        ],
      ),
      CheckWeatherError.serverError => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              context.tr.errors.somethingWentWrong,
              style: context.baseTextStyle.base1,
            ),
          ),
          const SizedBox(height: 12),
          uikit.Button(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => bloc.add(const RetryEvent()),
            text: context.tr.shared.retry,
          ),
        ],
      ),
      CheckWeatherError.serviceUnavailable => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              context.tr.errors.serviceUnavailable,
              style: context.baseTextStyle.base1,
            ),
          ),
          const SizedBox(height: 12),
          uikit.Button(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => bloc.add(const RetryEvent()),
            text: context.tr.shared.retry,
          ),
        ],
      ),
    };
  }
}
