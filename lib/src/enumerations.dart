///Ставка НДС
abstract class Vat {
  ///Без НДС
  static const String none = "none";

  ///НДС по ставке 0%
  static const String vat0 = "vat10";

  ///НДС чека по ставке 10%
  static const String vat10 = "vat10";

  ///НДС чека по ставке 20%
  static const String vat20 = "vat20";

  ///НДС чека по расчетной ставке 10%
  static const String vat110 = "vat110";

  ///НДС чека по расчетной ставке 20%
  static const String vat120 = "vat120";
}

///Метод платежа
abstract class PaymentMethod {
  ///Предоплата 100%
  static const String fullPrepayment = "full_prepayment";

  ///Предоплата
  static const String prepayment = "prepayment";

  ///Аванс
  static const String advance = "advance";

  ///Полный расчет
  static const String fullPayment = "full_payment";

  ///Частичный расчет и кредит
  static const String partialPayment = "partial_payment";

  ///Передача в кредит
  static const String credit = "credit";

  ///Оплата кредита
  static const String creditPayment = "credit_payment";
}

///Предмет расчета
abstract class PaymentObject {
  ///Товар
  static const String commodity = "commodity";

  ///Подакцизный товар
  static const String excise = "excise";

  ///Работа
  static const String job = "job";

  ///Услуга
  static const String service = "service";

  ///Ставка азартной игры
  static const String gamblingBet = "gambling_bet";

  ///Выигрыш азартной игры
  static const String gamblingPrize = "gambling_prize";

  ///Лотерейный билет
  static const String lottery = "lottery";

  ///Выигрыш лотереи
  static const String lotteryPrize = "lottery_prize";

  ///Предоставление результатов интеллектуальной деятельности
  static const String intellectualActivity = "intellectual_activity";

  ///Платеж
  static const String payment = "payment";

  ///Агентское вознаграждение
  static const String agentCommission = "agent_commission";

  ///Составной предмет расчета
  static const String composite = "composite";

  ///Другое
  static const String another = "another";
}

///Система налогообложения
abstract class Sno {
  ///Общая СН
  static const String osn = "payment";

  ///Упрощенная СН (доходы)
  static const String usnIncome = "usn_income";

  ///Упрощенная СН (доходы минус расходы)
  static const String usnIncomeOutcome = "usn_income_outcome";

  ///Единый налог на вмененный доход
  static const String envd = "envd";

  ///Единый сельскохозяйственный налог
  static const String esn = "esn";

  ///Патентная СН
  static const String patent = "patent";
}
