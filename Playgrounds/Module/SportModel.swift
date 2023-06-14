//
//  SportModel.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
import HandyJSON

struct SportModel: HandyJSON {
    var data: SportData?
    var message: String?
    var status: String?
    var success: Bool = false
    var timestamp: Int = 0
    var total: Int = 0
}

struct SportData: HandyJSON {
    var achieveTodayGoal: Bool = false
    var borg: SportDataBorg?
    var covidStreamer: Bool = false
    var dyspnea: SportDataDyspnea?
    var exerciseDetail: SportDataExerciseDetail?
    var exerciseId: Int = 0
    var exitReason = [String]()
    var guideVideo: SportDataGuideVideo?
    var haveHbp: Bool = false
    var safetyIndicator: SportDataSafetyIndicator?
    var safetyInstructions: SportDataSafetyInstructions?
    var sportTimeDto: SportDataSportTimeDto?
    var targetHeartRate: SportDataTargetHeartRate?
    var warmUpTargetHeartRate: SportDataWarmUpTargetHeartRate?
    var wear: Bool = false
}

struct SportDataGuideVideo: HandyJSON {
    var imageUrl: String?
    var videoUrl: String?
}

struct SportDataDyspnea: HandyJSON {
    var degrees = [SportDataDyspneaDegrees]()
    var question: String?
    var title: String?
}

struct SportDataDyspneaDegrees: HandyJSON {
    var degree: Float = 0.0
    var description: String?
    var explanation: String?
}

struct SportDataTargetHeartRate: HandyJSON {
    var alarm: Int = 0
    var lower: Int = 0
    var upper: Int = 0
}

struct SportDataWarmUpTargetHeartRate: HandyJSON {
    var duration: Int = 0
    var heartRate: Int = 0
}

struct SportDataSafetyInstructions: HandyJSON {
    var fullText = [String]()
    var isFirst: Bool = false
    var subText = [String]()
}

struct SportDataSafetyIndicator: HandyJSON {
    var comment: String?
    var createTime: Int = 0
    var id: Int = 0
    var name: String?
    var questions = [SportDataSafetyIndicatorQuestions]()
    var type: Int = 0
    var updateTime: Int = 0
}

struct SportDataSafetyIndicatorQuestions: HandyJSON {
    var checked: Bool = false
    var comment: String?
    var createTime: Int = 0
    var id: Int = 0
    var keyword: String?
    var optionRange: SportDataSafetyIndicatorQuestionsOptionRange?
    var options = [SportDataSafetyIndicatorQuestionsOptions]()
    var questionOrder: Int = 0
    var required: Bool = false
    var style: String?
    var title: String?
    var type: String?
    var updateTime: Int = 0
}

struct SportDataSafetyIndicatorQuestionsOptions: HandyJSON {
    var checked: Bool = false
    var cleanOther: Bool = false
    var comment: String?
    var createTime: Int = 0
    var id: Int = 0
    var optionOrder: Int = 0
    var optionRange: SportDataSafetyIndicatorQuestionsOptionsOptionRange?
    var priority: Int = 0
    var text: String?
    var updateTime: Int = 0
    var value: String?
}

struct SportDataSafetyIndicatorQuestionsOptionsOptionRange: HandyJSON {
    var checked: Bool = false
}

struct SportDataSafetyIndicatorQuestionsOptionRange: HandyJSON {

}

struct SportDataSportTimeDto: HandyJSON {
    var sportTimeDetailDtoList = [SportDataSportTimeDtoSportTimeDetailDtoList]()
    var totalDuration: Int = 0
}

struct SportDataSportTimeDtoSportTimeDetailDtoList: HandyJSON {
    var description: String?
    var duration: Int = 0
    var message: String?
    var roundId: String?
}

struct SportDataBorg: HandyJSON {
    var degrees = [SportDataBorgDegrees]()
    var question: String?
    var rpeType: Int = 0
    var title: String?
}

struct SportDataBorgDegrees: HandyJSON {
    var degree: Int = 0
    var description: String?
    var explanation: String?
}

struct SportDataExerciseDetail: HandyJSON {
    var audioMetas: SportDataExerciseDetailAudioMetas?
    var exercise: SportDataExerciseDetailExercise?
    var questionnaireMetas: SportDataExerciseDetailQuestionnaireMetas?
    var videoMetas: SportDataExerciseDetailVideoMetas?
}

struct SportDataExerciseDetailVideoMetas: HandyJSON {
    var name: String?
    var videos = [SportDataExerciseDetailVideoMetasVideos]()
}

struct SportDataExerciseDetailVideoMetasVideos: HandyJSON {
    var coverUrl: String?
    var duration: Int = 0
    var id: String?
    var introduction = [SportDataExerciseDetailVideoMetasVideosIntroduction]()
    var lastModifiedTime: Int = 0
    var name: String?
    var videoUrl: String?
}

struct SportDataExerciseDetailVideoMetasVideosIntroduction: HandyJSON {
    var content: String?
    var title: String?
}

struct SportDataExerciseDetailAudioMetas: HandyJSON {
    var audios = [SportDataExerciseDetailAudioMetasAudios]()
    var name: String?
}

struct SportDataExerciseDetailAudioMetasAudios: HandyJSON {
    var audioType: String?
    var audioUrl: String?
    var duration: Int = 0
    var id: String?
    var lastModifiedTime: Int = 0
    var priority: Int = 0
}

struct SportDataExerciseDetailExercise: HandyJSON {
    var actionsDisplay = [SportDataExerciseDetailExerciseActionsDisplay]()
    var coverUrl: String?
    var effectiveTime: String?
    var effectiveTimeTargetHigher: Int = 0
    var effectiveTimeTargetLower: Int = 0
    var exerciseGoals = [SportDataExerciseDetailExerciseExerciseGoals]()
    var name: String?
    var rounds = [SportDataExerciseDetailExerciseRounds]()
}

struct SportDataExerciseDetailExerciseRounds: HandyJSON {
    var displayName: String?
    var dontPlayAudioTypes = [String]()
    var fitnessViews = [SportDataExerciseDetailExerciseRoundsFitnessViews]()
    var mustPlayAudioTypes = [String]()
    var needLoop: Bool = false
    var pauseOperations = [SportDataExerciseDetailExerciseRoundsPauseOperations]()
    var roundId: String?
    var skipQuestionnaireId: String?
    var withComponentsOnVideoView = [String]()
}

struct SportDataExerciseDetailExerciseRoundsFitnessViews: HandyJSON {
    var actionId: String?
    var motionPrepare: SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepare?
    var needIntervention: Bool = false
    var viewDetail: SportDataExerciseDetailExerciseRoundsFitnessViewsViewDetail?
    var viewId: String?
    var viewName: String?
    var viewType: String?
}

struct SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepare: HandyJSON {
    var actionId: String?
    var needIntervention: Bool = false
    var viewDetail: SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepareViewDetail?
    var viewId: String?
    var viewName: String?
    var viewType: String?
}

struct SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepareViewDetail: HandyJSON {
    var audios = [SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepareViewDetailAudios]()
    var enableLoop: Int = 0
    var groupId: String?
    var originPlayType: String?
    var playType: String?
    var transitionType: String?
    var value: Int = 0
    var videoId: String?
}

struct SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepareViewDetailAudios: HandyJSON {
    var audioDetail = [SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepareViewDetailAudiosAudioDetail]()
    var audioPlayType: String?
}

struct SportDataExerciseDetailExerciseRoundsFitnessViewsMotionPrepareViewDetailAudiosAudioDetail: HandyJSON {
    var audioId: String?
    var propertyValue: Int = 0
    var type: Int = 0
}

struct SportDataExerciseDetailExerciseRoundsFitnessViewsViewDetail: HandyJSON {
    var duration: Int = 0
    var enableLoop: Int = 0
    var transitionType: String?
}

struct SportDataExerciseDetailExerciseRoundsPauseOperations: HandyJSON {
    var detail: SportDataExerciseDetailExerciseRoundsPauseOperationsDetail?
    var operation: String?
}

struct SportDataExerciseDetailExerciseRoundsPauseOperationsDetail: HandyJSON {
    var title: String?
}

struct SportDataExerciseDetailExerciseActionsDisplay: HandyJSON {
    var actions = [SportDataExerciseDetailExerciseActionsDisplayActions]()
    var roundId: String?
    var typeName: String?
}

struct SportDataExerciseDetailExerciseActionsDisplayActions: HandyJSON {
    var coverImageUrl: String?
    var id: String?
    var name: String?
}

struct SportDataExerciseDetailExerciseExerciseGoals: HandyJSON {
    var alwaysExist: Bool = false
    var condition: SportDataExerciseDetailExerciseExerciseGoalsCondition?
    var goalType: String?
    var interventions = [SportDataExerciseDetailExerciseExerciseGoalsInterventions]()
}

struct SportDataExerciseDetailExerciseExerciseGoalsCondition: HandyJSON {
    var and = [SportDataExerciseDetailExerciseExerciseGoalsConditionAnd]()
}

struct SportDataExerciseDetailExerciseExerciseGoalsConditionAnd: HandyJSON {
    var eq: SportDataExerciseDetailExerciseExerciseGoalsConditionAndEq?
    var ge: SportDataExerciseDetailExerciseExerciseGoalsConditionAndGe?
    var lt: SportDataExerciseDetailExerciseExerciseGoalsConditionAndLt?
}

struct SportDataExerciseDetailExerciseExerciseGoalsConditionAndLt: HandyJSON {
    var effectiveTime: Int = 0
}

struct SportDataExerciseDetailExerciseExerciseGoalsConditionAndEq: HandyJSON {
    var currentRound: String?
}

struct SportDataExerciseDetailExerciseExerciseGoalsConditionAndGe: HandyJSON {
    var effectiveTime: Int = 0
}

struct SportDataExerciseDetailExerciseExerciseGoalsInterventions: HandyJSON {
    var detail: SportDataExerciseDetailExerciseExerciseGoalsInterventionsDetail?
    var interventionType: String?
    var required: Bool = false
}

struct SportDataExerciseDetailExerciseExerciseGoalsInterventionsDetail: HandyJSON {
    var audios = [SportDataExerciseDetailExerciseExerciseGoalsInterventionsDetailAudios]()
}

struct SportDataExerciseDetailExerciseExerciseGoalsInterventionsDetailAudios: HandyJSON {
    var audioDetail = [SportDataExerciseDetailExerciseExerciseGoalsInterventionsDetailAudiosAudioDetail]()
    var audioPlayType: String?
}

struct SportDataExerciseDetailExerciseExerciseGoalsInterventionsDetailAudiosAudioDetail: HandyJSON {
    var audioId: String?
    var propertyValue: Int = 0
}

struct SportDataExerciseDetailQuestionnaireMetas: HandyJSON {
    var name: String?
    var questionnaires = [SportDataExerciseDetailQuestionnaireMetasQuestionnaires]()
}

struct SportDataExerciseDetailQuestionnaireMetasQuestionnaires: HandyJSON {
    var items = [SportDataExerciseDetailQuestionnaireMetasQuestionnairesItems]()
    var questionnaireId: String?
    var title: String?
}

struct SportDataExerciseDetailQuestionnaireMetasQuestionnairesItems: HandyJSON {
    var answers = [SportDataExerciseDetailQuestionnaireMetasQuestionnairesItemsAnswers]()
    var questionId: String?
    var results = [String]()
    var title: String?
    var widget: String?
}

struct SportDataExerciseDetailQuestionnaireMetasQuestionnairesItemsAnswers: HandyJSON {
    var answerId: String?
    var title: String?
    var type: String?
}
