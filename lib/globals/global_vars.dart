import 'package:professors/store/classes/classes_state.dart';
import 'package:professors/store/classes/edit_class_state.dart';
import 'package:professors/store/dashboard/dashboard_state.dart';
import 'package:professors/store/general/general_state.dart';
import 'package:professors/store/nationalities/nationalities_state.dart';
import 'package:professors/store/navigation/nav_state.dart';
import 'package:professors/store/notifications/notifications_state.dart';
import 'package:professors/store/notifications/settings_notifications_state.dart';
import 'package:professors/store/payments/settings_payments_state.dart';
import 'package:professors/store/support/support_contact_state.dart';
import 'package:professors/store/transactions/transactions_history_state.dart';
import 'package:professors/store/user/user_state.dart';
import 'package:professors/store/user/user_wallet_state.dart';

final userStore = UserState();
final userWallet = UserWalletState();

final navStore = NavState();
final generalStore = GeneralState();

final editOrCreateClassStore = EditClassState();

final dashboardStore = DashboardState();

final transactionsHistoryStore = TransactionsHistoryState();
final notificationsStore = SettingsNotificationsState();
final paymentsStore = SettingsPaymentsState();
final supportStore = SupportContactState();
final feedNotificationsStore = NotificationsState();
final classesStore = ClassesState(); // Classes Store
final nationalitiesStore = NationalitiesState(); // Nationalities