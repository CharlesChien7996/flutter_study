import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  GetTriviaForConcreteNumber(this.numberString);

  final String numberString;

  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNUmber extends NumberTriviaEvent {

}