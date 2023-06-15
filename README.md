# chatgptR
Packages for experimenting with ChatGPT in R

## How to install

You must first install the **remotes** package. Then,

```{r}
  remotes::install_github('drtagkim/chatgptR',
                          build_manual = TRUE,
                        build_vignettes = TRUE)
```

## How to use

After installing this package, you can find the manual in the vignette. Here are a few code snippets


```{r,eval=FALSE}
OPENAI_API_KEY="your api key here"
Sys.setenv(OPENAI_API_KEY = OPENAI_API_KEY)
Sys.setenv(OPENAI_RETURN_LANGUAGE = "korean") #korean
Sys.setenv(OPENAI_VERBOSE=FALSE) #or TRUE
Sys.setenv(OPENAI_TEMPERATURE = 0.5)
```

#### Basic Usage
```{r, eval=FALSE}
ask_chatgpt("hi")
```

### Leverage previous conversations (using conversation context)
```{r, eval=FALSE}
ask_chatgpt("승무는 무엇인가?",
            history_file = "dance_info.json",
            update=FALSE)
```

### Explain your knowledge in your own words
```{r, eval=FALSE}
ask_chatgpt("hi",context = "인사를 하면 농담을 같이 한다.")
```

### Providing knowledge data
```{r, eval=FALSE}
ask_chatgpt("승무에 대해 알려줘",
            knowledge_dir = "knowledge",
            context = "친절히 설명하기",
            history_file = "test_history_03.json",
            update = TRUE)
```

You may want to read [OpenAI API documents][ref1].

[ref1]: https://platform.openai.com/docs/api-reference/chat/create "OpenAI Document"
