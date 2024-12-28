part of 'my_cart_bloc.dart';

class MyCartState extends Equatable {
  final BlocStatus blocStatus;

  const MyCartState({
    this.blocStatus = BlocStatus.initial,
  });

  @override
  List<Object?> get props => [blocStatus];

  MyCartState copyWith({
    BlocStatus? blocStatus,
  }) {
    return MyCartState(
      blocStatus: blocStatus ?? this.blocStatus,
    );
  }
}
