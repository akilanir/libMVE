.class public Lorg/markdownj/MarkdownProcessor;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"


# static fields
.field private static final CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

.field private static final HTML_PROTECTOR:Lorg/markdownj/CharacterProtector;


# instance fields
.field private linkDefinitions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/markdownj/LinkDefinition;",
            ">;"
        }
    .end annotation
.end field

.field private listLevel:I

.field private rnd:Ljava/util/Random;

.field private tabWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    new-instance v0, Lorg/markdownj/CharacterProtector;

    invoke-direct {v0}, Lorg/markdownj/CharacterProtector;-><init>()V

    sput-object v0, Lorg/markdownj/MarkdownProcessor;->HTML_PROTECTOR:Lorg/markdownj/CharacterProtector;

    .line 58
    new-instance v0, Lorg/markdownj/CharacterProtector;

    invoke-direct {v0}, Lorg/markdownj/CharacterProtector;-><init>()V

    sput-object v0, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lorg/markdownj/MarkdownProcessor;->rnd:Ljava/util/Random;

    .line 56
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/markdownj/MarkdownProcessor;->linkDefinitions:Ljava/util/Map;

    .line 60
    const/4 v0, 0x4

    iput v0, p0, Lorg/markdownj/MarkdownProcessor;->tabWidth:I

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lorg/markdownj/MarkdownProcessor;->listLevel:I

    .line 67
    return-void
.end method

.method static synthetic access$000(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 3
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->encodeAmpsAndAngles(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2, p3}, Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)Z
    .registers 3
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->hasParagraphBreak(Lorg/markdownj/TextEditor;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 3
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doLists(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200()Lorg/markdownj/CharacterProtector;
    .registers 1

    .prologue
    .line 54
    sget-object v0, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    return-object v0
.end method

.method static synthetic access$200(Lorg/markdownj/MarkdownProcessor;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/markdownj/MarkdownProcessor;->linkDefinitions:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300()Lorg/markdownj/CharacterProtector;
    .registers 1

    .prologue
    .line 54
    sget-object v0, Lorg/markdownj/MarkdownProcessor;->HTML_PROTECTOR:Lorg/markdownj/CharacterProtector;

    return-object v0
.end method

.method static synthetic access$400(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)V
    .registers 2
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->unEscapeSpecialChars(Lorg/markdownj/TextEditor;)V

    return-void
.end method

.method static synthetic access$500(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->encodeEmail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lorg/markdownj/MarkdownProcessor;->deleteAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)V
    .registers 2
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->encodeCode(Lorg/markdownj/TextEditor;)V

    return-void
.end method

.method static synthetic access$800(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->processListItems(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Z
    .registers 3
    .param p0, "x0"    # Lorg/markdownj/MarkdownProcessor;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->isEmptyString(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private deleteAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "regex"    # Ljava/lang/String;

    .prologue
    .line 862
    const-string v0, ""

    invoke-direct {p0, p1, p2, v0}, Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private doAnchors(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 7
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    const/16 v4, 0x20

    .line 717
    const-string v3, "(\\[(.*?)\\][ ]?(?:\\n[ ]*)?\\[(.*?)\\])"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 722
    .local v1, "internalLink":Ljava/util/regex/Pattern;
    new-instance v3, Lorg/markdownj/MarkdownProcessor$11;

    invoke-direct {v3, p0}, Lorg/markdownj/MarkdownProcessor$11;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v1, v3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 755
    const-string v3, "(\\[(.*?)\\]\\([ \\t]*<?(.*?)>?[ \\t]*(([\'\"])(.*?)\\5)?\\))"

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 768
    .local v0, "inlineLink":Ljava/util/regex/Pattern;
    new-instance v3, Lorg/markdownj/MarkdownProcessor$12;

    invoke-direct {v3, p0}, Lorg/markdownj/MarkdownProcessor$12;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 796
    const-string v3, "(\\[([^\\[\\]]+)\\])"

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 801
    .local v2, "referenceShortcut":Ljava/util/regex/Pattern;
    new-instance v3, Lorg/markdownj/MarkdownProcessor$13;

    invoke-direct {v3, p0}, Lorg/markdownj/MarkdownProcessor$13;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v2, v3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 831
    return-object p1
.end method

.method private doAutoLinks(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 5
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 283
    const-string v1, "<((https?|ftp):[^\'\">\\s]+)>"

    const-string v2, "<a href=\"$1\">$1</a>"

    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 284
    const-string v1, "<([-.\\w]+\\@[-a-z0-9]+(\\.[-a-z0-9]+)*\\.[a-z]+)>"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 285
    .local v0, "email":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$3;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$3;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 295
    return-object p1
.end method

.method private doBlockQuotes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 5
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 326
    const-string v1, "((^[ \t]*>[ \t]?.+\\n(.+\\n)*\\n*)+)"

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 334
    .local v0, "p":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$4;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$4;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    move-result-object v1

    return-object v1
.end method

.method private doCodeBlocks(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 5
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 356
    const-string v1, "(?:\\n\\n|\\A)((?:(?:[ ]{4}).*\\n+)+)((?=^[ ]{0,4}\\S)|\\Z)"

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 364
    .local v0, "p":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$5;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$5;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    move-result-object v1

    return-object v1
.end method

.method private doCodeSpans(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 4
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 849
    const-string v0, "(?<!\\\\)(`+)(.+?)(?<!`)\\1(?!`)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    new-instance v1, Lorg/markdownj/MarkdownProcessor$14;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$14;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    move-result-object v0

    return-object v0
.end method

.method private doHeaders(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 5
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 590
    const-string v1, "^(.*)\n====+$"

    const-string v2, "<h1>$1</h1>"

    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 591
    const-string v1, "^(.*)\n----+$"

    const-string v2, "<h2>$1</h2>"

    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 594
    const-string v1, "^(#{1,6})\\s*(.*?)\\s*\\1?$"

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 595
    .local v0, "p":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$9;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$9;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 604
    return-object p1
.end method

.method private doHorizontalRules(Lorg/markdownj/TextEditor;)V
    .registers 9
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 160
    const/4 v5, 0x3

    new-array v2, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "\\*"

    aput-object v6, v2, v5

    const/4 v5, 0x1

    const-string v6, "-"

    aput-object v6, v2, v5

    const/4 v5, 0x2

    const-string v6, "_"

    aput-object v6, v2, v5

    .line 161
    .local v2, "hrDelimiters":[Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_15
    if-ge v3, v4, :cond_3a

    aget-object v1, v0, v3

    .line 162
    .local v1, "hrDelimiter":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "^[ ]{0,2}([ ]?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "[ ]?){3,}[ ]*$"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "<hr />"

    invoke-virtual {p1, v5, v6}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 161
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 164
    .end local v1    # "hrDelimiter":Ljava/lang/String;
    :cond_3a
    return-void
.end method

.method private doImages(Lorg/markdownj/TextEditor;)V
    .registers 5
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 674
    const-string v1, "!\\[(.*)\\]\\((.*) \"(.*)\"\\)"

    const-string v2, "<img src=\"$2\" alt=\"$1\" title=\"$3\" />"

    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 675
    const-string v1, "!\\[(.*)\\]\\((.*)\\)"

    const-string v2, "<img src=\"$2\" alt=\"$1\" />"

    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 678
    const-string v1, "([!]\\[(.*?)\\][ ]?(?:\\n[ ]*)?\\[(.*?)\\])"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 683
    .local v0, "imageLink":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$10;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$10;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 713
    return-void
.end method

.method private doItalicsAndBold(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 4
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 835
    const-string v0, "(\\*\\*|__)(?=\\S)(.+?[*_]*)(?<=\\S)\\1"

    const-string v1, "<strong>$2</strong>"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 836
    const-string v0, "(\\*|_)(?=\\S)(.+?)(?<=\\S)\\1"

    const-string v1, "<em>$2</em>"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 837
    return-object p1
.end method

.method private doLists(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 9
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    const/16 v6, 0x8

    .line 436
    iget v4, p0, Lorg/markdownj/MarkdownProcessor;->tabWidth:I

    add-int/lit8 v0, v4, -0x1

    .line 438
    .local v0, "lessThanTab":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(([ ]{0,"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "((?:[-+*]|\\d+[.]))"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "[ ]+"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "(?s:.+?)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\z"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "|"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\n{2,}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "(?=\\S)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "(?![ ]*"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "(?:[-+*]|\\d+[.])"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "[ ]+"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 458
    .local v3, "wholeList":Ljava/lang/String;
    iget v4, p0, Lorg/markdownj/MarkdownProcessor;->listLevel:I

    if-lez v4, :cond_9d

    .line 459
    new-instance v2, Lorg/markdownj/MarkdownProcessor$6;

    invoke-direct {v2, p0}, Lorg/markdownj/MarkdownProcessor$6;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    .line 492
    .local v2, "replacer":Lorg/markdownj/Replacement;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "^"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 493
    .local v1, "matchStartOfLine":Ljava/util/regex/Pattern;
    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 527
    :goto_9c
    return-object p1

    .line 495
    .end local v1    # "matchStartOfLine":Ljava/util/regex/Pattern;
    .end local v2    # "replacer":Lorg/markdownj/Replacement;
    :cond_9d
    new-instance v2, Lorg/markdownj/MarkdownProcessor$7;

    invoke-direct {v2, p0}, Lorg/markdownj/MarkdownProcessor$7;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    .line 522
    .restart local v2    # "replacer":Lorg/markdownj/Replacement;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(?:(?<=\\n\\n)|\\A\\n?)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 523
    .restart local v1    # "matchStartOfLine":Ljava/util/regex/Pattern;
    invoke-virtual {p1, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    goto :goto_9c
.end method

.method private encodeAmpsAndAngles(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 4
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 843
    const-string v0, "&(?!#?[xX]?(?:[0-9a-fA-F]+|\\w+);)"

    const-string v1, "&amp;"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 844
    const-string v0, "<(?![a-zA-Z/?\\$!])"

    const-string v1, "&lt;"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 845
    return-object p1
.end method

.method private encodeBackslashEscapes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 7
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 101
    const-string v2, "`_>!"

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 102
    .local v1, "normalChars":[C
    const-string v2, "*{}[]()#+-."

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 105
    .local v0, "escapedChars":[C
    const-string v2, "\\\\\\\\"

    sget-object v3, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v4, "\\"

    invoke-virtual {v3, v4}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/markdownj/TextEditor;->replaceAllLiteral(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 108
    const-string v2, "\\\\"

    invoke-direct {p0, p1, v1, v2}, Lorg/markdownj/MarkdownProcessor;->encodeEscapes(Lorg/markdownj/TextEditor;[CLjava/lang/String;)Lorg/markdownj/TextEditor;

    .line 109
    const-string v2, "\\\\\\"

    invoke-direct {p0, p1, v0, v2}, Lorg/markdownj/MarkdownProcessor;->encodeEscapes(Lorg/markdownj/TextEditor;[CLjava/lang/String;)Lorg/markdownj/TextEditor;

    .line 111
    return-object p1
.end method

.method private encodeCode(Lorg/markdownj/TextEditor;)V
    .registers 5
    .param p1, "ed"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 423
    const-string v0, "&"

    const-string v1, "&amp;"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 424
    const-string v0, "<"

    const-string v1, "&lt;"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 425
    const-string v0, ">"

    const-string v1, "&gt;"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 426
    const-string v0, "\\*"

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "*"

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 427
    const-string v0, "_"

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 428
    const-string v0, "\\{"

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "{"

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 429
    const-string v0, "\\}"

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "}"

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 430
    const-string v0, "\\["

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "["

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 431
    const-string v0, "\\]"

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 432
    const-string v0, "\\\\"

    sget-object v1, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v2, "\\"

    invoke-virtual {v1, v2}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 433
    return-void
.end method

.method private encodeEmail(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3b

    .line 306
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 307
    .local v7, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 308
    .local v2, "email":[C
    move-object v0, v2

    .local v0, "arr$":[C
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_e
    if-ge v3, v4, :cond_4e

    aget-char v1, v0, v3

    .line 309
    .local v1, "ch":C
    iget-object v8, p0, Lorg/markdownj/MarkdownProcessor;->rnd:Ljava/util/Random;

    invoke-virtual {v8}, Ljava/util/Random;->nextDouble()D

    move-result-wide v5

    .line 310
    .local v5, "r":D
    const-wide v8, 0x3fdccccccccccccdL    # 0.45

    cmpg-double v8, v5, v8

    if-gez v8, :cond_2f

    .line 311
    const-string v8, "&#"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 313
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 308
    :goto_2c
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 314
    :cond_2f
    const-wide v8, 0x3feccccccccccccdL    # 0.9

    cmpg-double v8, v5, v8

    if-gez v8, :cond_4a

    .line 315
    const-string v8, "&#x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    const/16 v8, 0x10

    invoke-static {v1, v8}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 319
    :cond_4a
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 322
    .end local v1    # "ch":C
    .end local v5    # "r":D
    :cond_4e
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private encodeEscapes(Lorg/markdownj/TextEditor;[CLjava/lang/String;)Lorg/markdownj/TextEditor;
    .registers 11
    .param p1, "text"    # Lorg/markdownj/TextEditor;
    .param p2, "chars"    # [C
    .param p3, "slashes"    # Ljava/lang/String;

    .prologue
    .line 115
    move-object v0, p2

    .local v0, "arr$":[C
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_28

    aget-char v1, v0, v2

    .line 116
    .local v1, "ch":C
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 117
    .local v4, "regex":Ljava/lang/String;
    sget-object v5, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lorg/markdownj/TextEditor;->replaceAllLiteral(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 115
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 119
    .end local v1    # "ch":C
    .end local v4    # "regex":Ljava/lang/String;
    :cond_28
    return-object p1
.end method

.method private escapeSpecialCharsWithinTagAttributes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 10
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 655
    invoke-virtual {p1}, Lorg/markdownj/TextEditor;->tokenizeHTML()Ljava/util/Collection;

    move-result-object v3

    .line 656
    .local v3, "tokens":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/markdownj/HTMLToken;>;"
    new-instance v1, Lorg/markdownj/TextEditor;

    const-string v5, ""

    invoke-direct {v1, v5}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 658
    .local v1, "newText":Lorg/markdownj/TextEditor;
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/markdownj/HTMLToken;

    .line 659
    .local v2, "token":Lorg/markdownj/HTMLToken;
    invoke-virtual {v2}, Lorg/markdownj/HTMLToken;->getText()Ljava/lang/String;

    move-result-object v4

    .line 660
    .local v4, "value":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/markdownj/HTMLToken;->isTag()Z

    move-result v5

    if-eqz v5, :cond_5d

    .line 661
    const-string v5, "\\\\"

    sget-object v6, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v7, "\\"

    invoke-virtual {v6, v7}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 662
    const-string v5, "`"

    sget-object v6, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v7, "`"

    invoke-virtual {v6, v7}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 663
    const-string v5, "\\*"

    sget-object v6, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v7, "*"

    invoke-virtual {v6, v7}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 664
    const-string v5, "_"

    sget-object v6, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    const-string v7, "_"

    invoke-virtual {v6, v7}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 666
    :cond_5d
    invoke-virtual {v1, v4}, Lorg/markdownj/TextEditor;->append(Ljava/lang/CharSequence;)V

    goto :goto_f

    .line 669
    .end local v2    # "token":Lorg/markdownj/HTMLToken;
    .end local v4    # "value":Ljava/lang/String;
    :cond_61
    return-object v1
.end method

.method private formParagraphs(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 8
    .param p1, "markup"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 259
    const-string v4, "\\A\\n+"

    invoke-virtual {p1, v4}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 260
    const-string v4, "\\n+\\z"

    invoke-virtual {p1, v4}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 263
    invoke-virtual {p1}, Lorg/markdownj/TextEditor;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_26

    .line 264
    const/4 v4, 0x0

    new-array v3, v4, [Ljava/lang/String;

    .line 268
    .local v3, "paragraphs":[Ljava/lang/String;
    :goto_13
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v4, v3

    if-ge v1, v4, :cond_5e

    .line 269
    aget-object v2, v3, v1

    .line 270
    .local v2, "paragraph":Ljava/lang/String;
    sget-object v4, Lorg/markdownj/MarkdownProcessor;->HTML_PROTECTOR:Lorg/markdownj/CharacterProtector;

    invoke-virtual {v4, v2}, Lorg/markdownj/CharacterProtector;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 271
    .local v0, "decoded":Ljava/lang/String;
    if-eqz v0, :cond_35

    .line 272
    aput-object v0, v3, v1

    .line 268
    :goto_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 266
    .end local v0    # "decoded":Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "paragraph":Ljava/lang/String;
    .end local v3    # "paragraphs":[Ljava/lang/String;
    :cond_26
    const-string v4, "\\n{2,}"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {p1}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "paragraphs":[Ljava/lang/String;
    goto :goto_13

    .line 274
    .restart local v0    # "decoded":Ljava/lang/String;
    .restart local v1    # "i":I
    .restart local v2    # "paragraph":Ljava/lang/String;
    :cond_35
    new-instance v4, Lorg/markdownj/TextEditor;

    invoke-direct {v4, v2}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Lorg/markdownj/MarkdownProcessor;->runSpanGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v4

    invoke-virtual {v4}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v2

    .line 275
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<p>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</p>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    goto :goto_23

    .line 278
    .end local v0    # "decoded":Ljava/lang/String;
    .end local v2    # "paragraph":Ljava/lang/String;
    :cond_5e
    new-instance v4, Lorg/markdownj/TextEditor;

    const-string v5, "\n\n"

    invoke-direct {p0, v5, v3}, Lorg/markdownj/MarkdownProcessor;->join(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    return-object v4
.end method

.method private hasParagraphBreak(Lorg/markdownj/TextEditor;)Z
    .registers 4
    .param p1, "item"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 581
    invoke-virtual {p1}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private hashHTMLBlocks(Lorg/markdownj/TextEditor;)V
    .registers 14
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 174
    const/16 v10, 0x14

    new-array v8, v10, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "p"

    aput-object v11, v8, v10

    const/4 v10, 0x1

    const-string v11, "div"

    aput-object v11, v8, v10

    const/4 v10, 0x2

    const-string v11, "h1"

    aput-object v11, v8, v10

    const/4 v10, 0x3

    const-string v11, "h2"

    aput-object v11, v8, v10

    const/4 v10, 0x4

    const-string v11, "h3"

    aput-object v11, v8, v10

    const/4 v10, 0x5

    const-string v11, "h4"

    aput-object v11, v8, v10

    const/4 v10, 0x6

    const-string v11, "h5"

    aput-object v11, v8, v10

    const/4 v10, 0x7

    const-string v11, "h6"

    aput-object v11, v8, v10

    const/16 v10, 0x8

    const-string v11, "blockquote"

    aput-object v11, v8, v10

    const/16 v10, 0x9

    const-string v11, "pre"

    aput-object v11, v8, v10

    const/16 v10, 0xa

    const-string v11, "table"

    aput-object v11, v8, v10

    const/16 v10, 0xb

    const-string v11, "dl"

    aput-object v11, v8, v10

    const/16 v10, 0xc

    const-string v11, "ol"

    aput-object v11, v8, v10

    const/16 v10, 0xd

    const-string v11, "ul"

    aput-object v11, v8, v10

    const/16 v10, 0xe

    const-string v11, "script"

    aput-object v11, v8, v10

    const/16 v10, 0xf

    const-string v11, "noscript"

    aput-object v11, v8, v10

    const/16 v10, 0x10

    const-string v11, "form"

    aput-object v11, v8, v10

    const/16 v10, 0x11

    const-string v11, "fieldset"

    aput-object v11, v8, v10

    const/16 v10, 0x12

    const-string v11, "iframe"

    aput-object v11, v8, v10

    const/16 v10, 0x13

    const-string v11, "math"

    aput-object v11, v8, v10

    .line 178
    .local v8, "tagsA":[Ljava/lang/String;
    const/4 v10, 0x2

    new-array v9, v10, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "ins"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string v11, "del"

    aput-object v11, v9, v10

    .line 180
    .local v9, "tagsB":[Ljava/lang/String;
    const-string v10, "|"

    invoke-direct {p0, v10, v8}, Lorg/markdownj/MarkdownProcessor;->join(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "alternationA":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "|"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "|"

    invoke-direct {p0, v11, v9}, Lorg/markdownj/MarkdownProcessor;->join(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 183
    .local v1, "alternationB":Ljava/lang/String;
    iget v10, p0, Lorg/markdownj/MarkdownProcessor;->tabWidth:I

    add-int/lit8 v2, v10, -0x1

    .line 196
    .local v2, "less_than_tab":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "(^<("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\\b"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(.*\\n)*?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</\\2>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "[ ]*"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(?=\\n+|\\Z))"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0xa

    invoke-static {v10, v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 204
    .local v3, "p1":Ljava/util/regex/Pattern;
    new-instance v7, Lorg/markdownj/MarkdownProcessor$2;

    invoke-direct {v7, p0}, Lorg/markdownj/MarkdownProcessor$2;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    .line 210
    .local v7, "protectHTML":Lorg/markdownj/Replacement;
    invoke-virtual {p1, v3, v7}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 213
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "(^<("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\\b"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(.*\\n)*?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".*</\\2>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "[ ]*"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(?=\\n+|\\Z))"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0xa

    invoke-static {v10, v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 221
    .local v4, "p2":Ljava/util/regex/Pattern;
    invoke-virtual {p1, v4, v7}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 224
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "(?:(?<=\\n\\n)|\\A\\n?)([ ]{0,"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "}"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<(hr)"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\\b"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "([^<>])*?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/?>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "[ ]*"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(?=\\n{2,}|\\Z))"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-static {v10, v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    .line 237
    .local v5, "p3":Ljava/util/regex/Pattern;
    invoke-virtual {p1, v5, v7}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 240
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "(?:(?<=\\n\\n)|\\A\\n?)([ ]{0,"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "}"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(?s:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<!"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(--.*?--\\s*)+"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ">"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "[ ]*"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(?=\\n{2,}|\\Z)"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    .line 255
    .local v6, "p4":Ljava/util/regex/Pattern;
    invoke-virtual {p1, v6, v7}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 256
    return-void
.end method

.method private isEmptyString(Ljava/lang/String;)Z
    .registers 3
    .param p1, "leadingLine"    # Ljava/lang/String;

    .prologue
    .line 585
    if-eqz p1, :cond_a

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private join(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "strings"    # [Ljava/lang/String;

    .prologue
    .line 608
    array-length v2, p2

    .line 609
    .local v2, "length":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 610
    .local v0, "buf":Ljava/lang/StringBuilder;
    if-lez v2, :cond_1d

    .line 611
    const/4 v3, 0x0

    aget-object v3, p2, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_f
    if-ge v1, v2, :cond_1d

    .line 613
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p2, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 616
    .end local v1    # "i":I
    :cond_1d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static main([Ljava/lang/String;)V
    .registers 9
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 883
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 884
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v5, 0x400

    new-array v1, v5, [C

    .line 885
    .local v1, "cbuf":[C
    new-instance v4, Ljava/io/InputStreamReader;

    sget-object v5, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 887
    .local v4, "in":Ljava/io/Reader;
    :try_start_10
    invoke-virtual {v4, v1}, Ljava/io/Reader;->read([C)I

    move-result v2

    .line 888
    .local v2, "charsRead":I
    :goto_14
    if-ltz v2, :cond_1f

    .line 889
    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 890
    invoke-virtual {v4, v1}, Ljava/io/Reader;->read([C)I

    move-result v2

    goto :goto_14

    .line 892
    :cond_1f
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Lorg/markdownj/MarkdownProcessor;

    invoke-direct {v6}, Lorg/markdownj/MarkdownProcessor;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/markdownj/MarkdownProcessor;->markdown(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_31} :catch_32

    .line 897
    .end local v2    # "charsRead":I
    :goto_31
    return-void

    .line 893
    :catch_32
    move-exception v3

    .line 894
    .local v3, "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error reading input: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 895
    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    goto :goto_31
.end method

.method private processListItems(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "list"    # Ljava/lang/String;

    .prologue
    .line 551
    iget v1, p0, Lorg/markdownj/MarkdownProcessor;->listLevel:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/markdownj/MarkdownProcessor;->listLevel:I

    .line 554
    const-string v1, "\\n{2,}\\z"

    const-string v2, "\n"

    invoke-direct {p0, p1, v1, v2}, Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 556
    const-string v1, "(\\n)?^([ \\t]*)([-+*]|\\d+[.])[ ]+((?s:.+?)(\\n{1,2}))(?=\\n*(\\z|\\2([-+\\*]|\\d+[.])[ \\t]+))"

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 561
    .local v0, "p":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$8;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$8;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-direct {p0, p1, v0, v1}, Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Ljava/lang/String;

    move-result-object p1

    .line 576
    iget v1, p0, Lorg/markdownj/MarkdownProcessor;->listLevel:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/markdownj/MarkdownProcessor;->listLevel:I

    .line 577
    return-object p1
.end method

.method private replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "regex"    # Ljava/lang/String;
    .param p3, "replacement"    # Ljava/lang/String;

    .prologue
    .line 866
    new-instance v0, Lorg/markdownj/TextEditor;

    invoke-direct {v0, p1}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 867
    .local v0, "ed":Lorg/markdownj/TextEditor;
    invoke-virtual {v0, p2, p3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 868
    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private replaceAll(Ljava/lang/String;Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Ljava/lang/String;
    .registers 6
    .param p1, "markup"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/util/regex/Pattern;
    .param p3, "replacement"    # Lorg/markdownj/Replacement;

    .prologue
    .line 872
    new-instance v0, Lorg/markdownj/TextEditor;

    invoke-direct {v0, p1}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 873
    .local v0, "ed":Lorg/markdownj/TextEditor;
    invoke-virtual {v0, p2, p3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 874
    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private stripLinkDefinitions(Lorg/markdownj/TextEditor;)V
    .registers 5
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 123
    const-string v1, "^[ ]{0,3}\\[(.+)\\]:[ \\t]*\\n?[ \\t]*<?(\\S+?)>?[ \\t]*\\n?[ \\t]*(?:[\"(](.+?)[\")][ \\t]*)?(?:\\n+|\\Z)"

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 131
    .local v0, "p":Ljava/util/regex/Pattern;
    new-instance v1, Lorg/markdownj/MarkdownProcessor$1;

    invoke-direct {v1, p0}, Lorg/markdownj/MarkdownProcessor$1;-><init>(Lorg/markdownj/MarkdownProcessor;)V

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 145
    return-void
.end method

.method private unEscapeSpecialChars(Lorg/markdownj/TextEditor;)V
    .registers 6
    .param p1, "ed"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 299
    sget-object v3, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    invoke-virtual {v3}, Lorg/markdownj/CharacterProtector;->getAllEncodedTokens()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 300
    .local v0, "hash":Ljava/lang/String;
    sget-object v3, Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;

    invoke-virtual {v3, v0}, Lorg/markdownj/CharacterProtector;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 301
    .local v2, "plaintext":Ljava/lang/String;
    invoke-virtual {p1, v0, v2}, Lorg/markdownj/TextEditor;->replaceAllLiteral(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    goto :goto_a

    .line 303
    .end local v0    # "hash":Ljava/lang/String;
    .end local v2    # "plaintext":Ljava/lang/String;
    :cond_20
    return-void
.end method


# virtual methods
.method public markdown(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "txt"    # Ljava/lang/String;

    .prologue
    .line 76
    if-nez p1, :cond_4

    .line 77
    const-string p1, ""

    .line 79
    :cond_4
    new-instance v0, Lorg/markdownj/TextEditor;

    invoke-direct {v0, p1}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 82
    .local v0, "text":Lorg/markdownj/TextEditor;
    const-string v1, "\\r\\n"

    const-string v2, "\n"

    invoke-virtual {v0, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 83
    const-string v1, "\\r"

    const-string v2, "\n"

    invoke-virtual {v0, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 84
    const-string v1, "^[ \\t]+$"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 87
    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Lorg/markdownj/TextEditor;->append(Ljava/lang/CharSequence;)V

    .line 89
    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->detabify()Lorg/markdownj/TextEditor;

    .line 90
    const-string v1, "^[ ]+$"

    invoke-virtual {v0, v1}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 91
    invoke-direct {p0, v0}, Lorg/markdownj/MarkdownProcessor;->hashHTMLBlocks(Lorg/markdownj/TextEditor;)V

    .line 92
    invoke-direct {p0, v0}, Lorg/markdownj/MarkdownProcessor;->stripLinkDefinitions(Lorg/markdownj/TextEditor;)V

    .line 93
    invoke-virtual {p0, v0}, Lorg/markdownj/MarkdownProcessor;->runBlockGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    .line 94
    invoke-direct {p0, v0}, Lorg/markdownj/MarkdownProcessor;->unEscapeSpecialChars(Lorg/markdownj/TextEditor;)V

    .line 96
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Lorg/markdownj/TextEditor;->append(Ljava/lang/CharSequence;)V

    .line 97
    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public runBlockGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 3
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doHeaders(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 149
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doHorizontalRules(Lorg/markdownj/TextEditor;)V

    .line 150
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doLists(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 151
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doCodeBlocks(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 152
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doBlockQuotes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 154
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->hashHTMLBlocks(Lorg/markdownj/TextEditor;)V

    .line 156
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->formParagraphs(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    return-object v0
.end method

.method public runSpanGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    .registers 4
    .param p1, "text"    # Lorg/markdownj/TextEditor;

    .prologue
    .line 620
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->escapeSpecialCharsWithinTagAttributes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object p1

    .line 621
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doCodeSpans(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object p1

    .line 622
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->encodeBackslashEscapes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object p1

    .line 624
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doImages(Lorg/markdownj/TextEditor;)V

    .line 625
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doAnchors(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 626
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doAutoLinks(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 632
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->escapeSpecialCharsWithinTagAttributes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object p1

    .line 634
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->encodeAmpsAndAngles(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 635
    invoke-direct {p0, p1}, Lorg/markdownj/MarkdownProcessor;->doItalicsAndBold(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    .line 638
    const-string v0, " {2,}\n"

    const-string v1, " <br />\n"

    invoke-virtual {p1, v0, v1}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 639
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 879
    const-string v0, "Markdown Processor for Java 0.4.0 (compatible with Markdown 1.0.2b2)"

    return-object v0
.end method
