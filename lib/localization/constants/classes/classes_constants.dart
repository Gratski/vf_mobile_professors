class ClassConstants {

  String get classesClassesWord => "CLASSES_CLASSES_WORD";
  String get classesAllWord => "CLASSES_ALL_WORD";
  String get classesYourWord => "CLASSES_YOUR_WORD";
  String get classesSubTitle => "CLASSES_SUB_TITLE";
  String get classesScheduleLabel => "CLASSES_SCHEDULE_LABEL";
  String get classesCalendarLabel => "CLASSES_CALENDAR_LABEL";
  String get classesActiveLabel => "CLASSES_ACTIVE_LABEL";
  String get classesInactiveLabel => "CLASSES_INACTIVE_LABEL";

  // class status labels
  String get classesWaitingForApprovalLabel => "CLASSES_WAITING_FOR_APPROVAL_LABEL";
  String get classesApprovedLabel => "CLASSES_APPROVED_LABEL";
  String get classesRejectedLabel => "CLASSES_REJECTED_LABEL";
  String get classesReportedLabel => "CLASSES_REPORTED_LABEL";

  String get classesDurationLabel => "CLASSES_DURATION_LABEL";
  String get classesViewLabel => "CLASSES_VIEW_LABEL";
  String get classesEditLabel => "CLASSES_EDIT_LABEL";
  String get classesShareLabel => "CLASSES_SHARE_LABEL";
  String get classesAddDatesLabel => "CLASSES_ADD_DATES_LABEL";
  String get classesAddClassButtonLabel => "CLASSES_ADD_CLASS_BUTTON_LABEL";

  String get classDetailsLevelLabel => "CLASS_DETAILS_LEVEL_LABEL";
  String get classDetailsDescriptionLabel => "CLASS_DETAILS_DESCRIPTION_LABEL";
  String get classDetailsBookButtonLabel => "CLASS_DETAILS_BOOK_BUTTON_LABEL";
  String get classDetailsInstructorLabel => "CLASS_DETAILS_INSTRUCTOR_LABEL";
  String get classDetailsEquipmentLabel => "CLASS_DETAILS_EQUIPMENT_LABEL";
  String get classDetailsClassGoalsLabel => "CLASS_DETAILS_CLASS_GOALS_LABEL";
  String get classDetailsCommentsLabel => "CLASS_DETAILS_COMMENTS_LABEL";
  String get classDetailsLoadCommentsLabel => "CLASS_DETAILS_LOAD_COMMENTS_LABEL";
  String get classDetailsNoCommentsYetText => "CLASS_DETAILS_NO_COMMENTS_YET";

  String get classCreatedOrUpdatedTopHeader => "CLASS_CREATED_OR_UPDATED_TOP_HEADER";
  String get classCreatedOrUpdatedSubTitleCreated => "CLASS_CREATED_OR_UPDATED_SUB_TITLE_CREATED";
  String get classCreatedOrUpdatedSubTitleUpdated => "CLASS_CREATED_OR_UPDATED_SUB_TITLE_UPDATED";
  String get classCreatedOrUpdatedOkButtonLabel => "CLASS_CREATED_OR_UPDATED_OK_BUTTON_LABEL";

  String get classDeletedTopHeader => "CLASS_DELETED_TOP_HEADER";
  String get classDeletedSubTitle => "CLASS_DELETED_SUB_TITLE";

  String getStatusLabel(int status) {
    switch(status) {
      case 1: return classesWaitingForApprovalLabel;
      case 2: return classesApprovedLabel;
      case 3: return classesRejectedLabel;
      case 4: return classesReportedLabel;
    }
  }


}