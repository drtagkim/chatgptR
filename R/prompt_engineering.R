#' Prompt Enginnering Function - Sentence Writer Based on Supplied Keywords
#'
#' Sentence Writer Based on Supplied Keywords
#'
#' @export
pe_write_eng_sentence_based_idea <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Output should be in English. ") %>%
    teach_gpt(intent="Output should be one sentence. ") %>%
    teach_gpt(intent="Inputs are list of keywords reflecting ideas. ") %>%
    teach_gpt(intent="Translate all into English") %>%
    teach_gpt(me="3 contributions",you="This paper makes three main contributions.") %>%
    teach_gpt(me="emotional support, OHCs, negative impact, unintended recipients",
              you="First, we find that emotional support in OHCs could have a negative impact on unintended recipients.") %>%
    teach_gpt(me="외관, 효과, 지원 구하는 사람들, 비교, 다른 사람들, 지원을 받았다, 정기적 인 상담 과정, 일반적인, OHCs",
              you="The appearance of this effect is due to support seekers’ comparison with others who have received support, which does not exist in the regular consultation process but is common in OHCs. ") %>%
    teach_gpt(me="활용, 양방향 구조, 시간적 순서, 답글 상호 작용, 게시물, 딥러닝 모델, 차별화, 정서적 지원, 보조 콘텐츠",
              you="we leverage the two-directional structure (temporal sequence and reply interactions) of posts to build a deep learning model to differentiate emotional support from auxiliary content.") %>%
    teach_gpt(me="평가, 아웃퍼폼, 최첨단 알고리즘, 분류, 불균형 게시물, 불균형 게시물",
              you="Our evaluation shows that it outperforms state-of-the-art algorithms in classifying unbalanced posts.") %>%
    teach_gpt(me="Beaudoin, Tao, 2007, 연구, 온라인 암 커뮤니티, 발견, 온라인 사회적 지원, 긍정적 인 결과, 스트레스에 대처, 우울증.",
               you="Beaudoin and Tao (2007) studied an online cancer community and found that online social support led to positive outcomes in dealing with stress and depression.") %>%
    teach_gpt(me="Aarts, et al., 2015, 온라인 전문가 포럼, 긍정적 인 영향을 미치는, 환자 결과, 환자, 요구하다, 정서적 지원, 의료 서비스 제공자",
              you="Aarts et al. (2015) found that an online expert forum positively influenced patient outcomes since patients require emotional support from their care providers.") %>%
    teach_gpt(me="관계, 정서적 지원, 감정, 연구, 선행, 지각 된 정서적 지원, 더 강한 지각 된 지원, 더 나은 지원 효과",
              you="Given the clear relationship between emotional support and emotions, some studies have focused on the antecedents of (perceived) emotional support, where stronger perceived support would indicate a better support effect. ") %>%
    teach_gpt(me="Chung, 2014, 보여, 사용, 토론 게시판, 온라인 소셜 네트워킹 기능, 친구 사귀기, 공유, 블로그, 도움이되는, 만족스러운 필요, 정서적 지원",
              you="Chung (2014) showed that the usage of discussion boards and online social networking features, such as friending and sharing on blogs, are both helpful in satisfying the need for emotional support.") %>%
    teach_gpt(me="설명하다, 격차, 문헌, 차별화, 이전 연구, 주제, 영향을 받다, 측정, 정서적 지원, 표 1",
              you="To illustrate the gap in the literature, we differentiate previous research according to how subjects are influenced and the measure of emotional support (see Table 1).") %>%
    teach_gpt(me="연구, 탐구, 감정적 효과, 주제, 시작하다, 행동, 조치",
              you="A few studies have explored the emotional effect on subjects who initiate the action. ") %>%
    teach_gpt(me="측정, 관점, 연구, 의존, 자기 공개, 설문지, 정서적 지원, Nambisan, 2011",
              you="From a measurement perspective, some studies have relied on self-disclosure in questionnaires to measure emotional support (Nambisan, 2011). ") %>%
    teach_gpt(me="확장하다, 기존 문헌, 초점, 사용자, 제공자, 대상, 정서적 지원, 검사, 정서적 영향, OHCs",
              you="To extend the existing literature, we focus on users who are either the provider or the target of emotional support to examine the emotional impact of OHCs.") %>%
    teach_gpt(me="확장, 이전 OHC 연구, 관점, 정서적 지원, 필요한, 고용, 정서적 전염 이론, 설명하다, 정서적 영향, OHCs.",
              you="Extending previous OHC studies from the perspective of emotional support, we consider it necessary to employ emotional contagion theory to explain the emotional impact of OHCs.") %>%
    teach_gpt(me="정서적 전염, 컴퓨터 매개 커뮤니케이션, 인스턴트 메시징, Hancock et al., 2008",
              you="Recently, emotional contagion has also been found in computer-mediated communication, such as instant messaging (Hancock et al., 2008).") %>%
    teach_gpt(me="제한된 연구, 유형, 소셜 미디어, 공부, 감정적 인 전염, 정서적 인 전염",
              you="There was limited research on this type of social media when studying emotional contagion. ")
}

#' Prompt Enginnering Function - Checking the inclusion of keywords
#'
#' Checking the inclusion of keywords
#'
#' @export
pe_topic_flag <- function(knowledge=NULL,topic_keyword="") {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Check whether the message provided by users ") %>%
    teach_gpt(intent="Contains relevant keywords. ") %>%
    teach_gpt(intent="Value as 0(=has not) or 1(=has), ") %>%
    teach_gpt("Results should be JSON format. ") %>%
    #teach_gpt("Resonse example: \"keyword\":1") %>%
    #teach_gpt("Resonse example: \"keyword\":0") %>%
    teach_gpt(paste0("Keyword:",topic_keyword,collapse = " ")) %>%
    teach_gpt("You should check whether each keyword is included or not. ")
    #teach_gpt("For example, suppose the sentence has words like A, B, C, D. If keywords are A, B and F, then A:1, B:1, F:0 ")
}

#' Prompt Enginnering Function - Editing a paragraph in academic styling
#'
#' Editing a paragraph in academic styling
#'
#' @export
pe_edit_eng_writing <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Edit the sentence in English. ") %>%
    teach_gpt(intent="Write in an academic style. ") %>%
    teach_gpt(intent="Write in an academic style. For example, suppose you're writing a social science paper. ") %>%
    teach_gpt(intent="Answer in English. ")
}

#' Prompt Enginnering Function - Editing a paragraph in academic styling (Korean)
#'
#' Editing a paragraph in academic styling (Korean)
#'
#' @export
pe_edit_kor_writing <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Edit the sentence in Korean. ") %>%
    teach_gpt(intent="Write in an academic style. ") %>%
    teach_gpt(intent="Write in an academic style. For example, suppose you're writing a social science paper. ") %>%
    teach_gpt(intent="Answer in Korean. ") %>%
    teach_gpt(intent="Just show me output result only. ") %>%
    teach_gpt(intent="In Korean, the end of sentence should be ~이다 Not ~입니다.")
}

#' Prompt Engineering Function - Generate a script for Powerpoint presentation
#'
#' Generate a script for Powerpoint presentation
#'
#' @export
pe_eng_script_writing <- function(knowledge=NULL,seconds=20) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Input: words representing ideas and topics ") %>%
    teach_gpt(intent="You should translate user input into English first. ") %>%
    teach_gpt(intent="Output: English paragraph containing presentation scripts. ") %>%
    teach_gpt(intent="Suppose that a human will read it in front of academic audiance. ") %>%
    teach_gpt(intent="It should be natural, fluenct and friendly. ") %>%
    teach_gpt(intent="The output script is not in start nor in end. It is in the middle of presentatin. ") %>%
    teach_gpt(intent="Do not add information that is not provided by a user.") %>%
    teach_gpt(intent="Keep in mind that the reading should be finished within specific duration.") %>%
    teach_gpt(intent=paste0("For exmaple, the length of speaking will be:",seconds," seconds",collapse=" "))
}

#' Prompt Engineering Function - Generating a news title in English
#'
#' Prompt Engineering Function - Generating a news title in English
#'
#'
#' @export
pe_eng_title <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Make a news title based on the input. ") %>%
    teach_gpt(intent="One sentence ") %>%
    teach_gpt(intent="Translate the output into English. ")
}

#' Prompt Engineering Function - Reporting news summary
#'
#' Prompt Engineering Function - Reporting news summary
#'
#' @export
#'
pe_news_title <- function(search_query,naver_client_id=NULL,naver_client_secret=NULL) {
  p1 = "Assistant will provide news headline summary. Results should be natural descriptions."
  p2 = "Sentences should be output."
  p3 = "In the following news headlines contains in Google:"
  p4 = paste0(get_gs_news_title(search_query),collapse = " ")
  if(!is.null(naver_client_id) & !is.null(naver_client_secret)) {
    p5 = "And the following are news articles relating to user query in Naver:"
    p6 = paste0(get_naver_news(search_query,naver_client_id,naver_client_secret),collapse=" ")
  } else {
    p5 = ""
    p6 = ""
  }
  paste0(p1,p2,p3,p4,p5,p6,collapse=' ')
}

#' Prompt Engineering Function - Citation at the end of a sentence
#'
#' Prompt Engineering Function - Citation at the end of a sentence
#'
#' @export
#'
pe_citation_end <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Output should be in English.") %>%
    teach_gpt(intent="Output should be one sentence.") %>%
    teach_gpt(intent="Translate all into English") %>%
    teach_gpt(intent="Citation should be in APA6th style.") %>%
    teach_gpt(intent="If author names (e.g., Tom) are provided first, the sentence should starts with like Tom (1999)") %>%
    teach_gpt(me="100,000 chatbots, created in less than year, Facebook Messenger. By Jonshon, 2017.",
              you="Over 100,000 chatbots have been created in less than one year on Facebook Messenger alone (Johnson, 2017).") %>%
    teach_gpt(
      me="The technology itself is frequently met with consumer skepticism as shown by market research in several European countries. By Elsner, 2017",
      you="The technology itself is frequently met with consumer skepticism as shown by market research in several European countries (Elsner, 2017)."
    )
}
#' Article File Rename
#'
#' Article File Rename
#'
#' @export
pe_rename_article_file_name <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="rename a file name(=input).") %>%
    teach_gpt(intent="your output is just a name string, not including a file extension.") %>%
    teach_gpt(me="McKnight, D. H., Choudhury, V., & Kacmar, C. (2002). Developing and validating trust measures for e-commerce: An integrative typology. Information systems research, 13(3), 334-359.",
              you="McKnight_etal(2002)_Information systems research_developing-and-validating-trust") %>%
    teach_gpt(me="Zhu, K., & Kraemer, K. L. (2002). E-commerce metrics for net-enhanced organizations: Assessing the value of e-commerce to firm performance in the manufacturing sector. Information systems research, 13(3), 275-295.",
              you="Zhu_Kraemer(2002)_Information systems research_e-commerce-metrics-for-ent-enhanced") %>%
    teach_gpt(me="Chatterjee, D., Grewal, R., & Sambamurthy, V. (2002). Shaping up for e-commerce: institutional enablers of the organizational assimilation of web technologies. MIS quarterly, 65-89.",
              you="Chatterjee_etal(2002)_MIS quarterly_shaping-up-for-e-commerce") %>%
    teach_gpt(me="Xiao, B., & Benbasat, I. (2011). Product-related deception in e-commerce: A theoretical perspective. Mis Quarterly, 169-195.",
              you="Xiao_Benbasat(2011)_Mis Quarterly_product-related-deception-in-e-commerce")
}

#' Prompt Engineering - Extract keywords and ideas
#'
#' Prompt Engineering - Extract keywords and ideas
#'
#'
#' @export
pe_extract_keywords_ideas <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Extracting key ideas and keywords in the sentence.") %>%
    teach_gpt(intent="Combining results with commans.") %>%
    teach_gpt(intent="Results should be only consisted of words and commas.")
}
#' Prompt Engineering - Generating a Topic Sentence
#'
#' Prompt Engineering - Generating a Topic Sentence
#'
#' @export
#'
pe_get_topic_sentece <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Read what the user presents and generate topic sentences.") %>%
    teach_gpt(intent="Present the result as a single sentence in English.") %>%
    teach_gpt(intent="It does not print quotation marks or punctuation to indicate a quote.") %>%
    teach_gpt(intent="The result should be consisted only one sentence.") %>%
    teach_gpt(intent="The result should be simple and easy to understand.") %>%
    teach_gpt(me="Summarize and create a topic sentence about the following paragraph. Can you?",you="Yes.")

}

#' Prompt Engineering - text rank
#'
#' Prompt Engineering - text rank
#'
#' @export
#'
pe_textrank_idea <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Analyze text to extract keywords based on textrank.")
}

#'
#'
pe_emotion_keywords <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%

}
