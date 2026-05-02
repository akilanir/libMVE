.class public Ljp/wasabeef/richeditor/RichEditor;
.super Landroid/webkit/WebView;
.source "RichEditor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;,
        Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;,
        Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;,
        Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;,
        Ljp/wasabeef/richeditor/RichEditor$Type;
    }
.end annotation


# static fields
.field private static final CALLBACK_SCHEME:Ljava/lang/String; = "re-callback://"

.field private static final SETUP_HTML:Ljava/lang/String; = "file:///android_asset/editor.html"

.field private static final STATE_SCHEME:Ljava/lang/String; = "re-state://"


# instance fields
.field private isReady:Z

.field private mContents:Ljava/lang/String;

.field private mDecorationStateListener:Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;

.field private mLoadListener:Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;

.field private mTextChangeListener:Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljp/wasabeef/richeditor/RichEditor;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 85
    const v0, 0x1010085

    invoke-direct {p0, p1, p2, v0}, Ljp/wasabeef/richeditor/RichEditor;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 86
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 74
    iput-boolean v0, p0, Ljp/wasabeef/richeditor/RichEditor;->isReady:Z

    .line 92
    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->setVerticalScrollBarEnabled(Z)V

    .line 93
    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->setHorizontalScrollBarEnabled(Z)V

    .line 94
    invoke-virtual {p0}, Ljp/wasabeef/richeditor/RichEditor;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 95
    new-instance v0, Landroid/webkit/WebChromeClient;

    invoke-direct {v0}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 96
    invoke-virtual {p0}, Ljp/wasabeef/richeditor/RichEditor;->createWebviewClient()Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 97
    const-string v0, "file:///android_asset/editor.html"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->loadUrl(Ljava/lang/String;)V

    .line 99
    invoke-direct {p0, p1, p2}, Ljp/wasabeef/richeditor/RichEditor;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 100
    return-void
.end method

.method static synthetic access$000(Ljp/wasabeef/richeditor/RichEditor;)Z
    .registers 2
    .param p0, "x0"    # Ljp/wasabeef/richeditor/RichEditor;

    .prologue
    .line 39
    iget-boolean v0, p0, Ljp/wasabeef/richeditor/RichEditor;->isReady:Z

    return v0
.end method

.method static synthetic access$002(Ljp/wasabeef/richeditor/RichEditor;Z)Z
    .registers 2
    .param p0, "x0"    # Ljp/wasabeef/richeditor/RichEditor;
    .param p1, "x1"    # Z

    .prologue
    .line 39
    iput-boolean p1, p0, Ljp/wasabeef/richeditor/RichEditor;->isReady:Z

    return p1
.end method

.method static synthetic access$100(Ljp/wasabeef/richeditor/RichEditor;)Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;
    .registers 2
    .param p0, "x0"    # Ljp/wasabeef/richeditor/RichEditor;

    .prologue
    .line 39
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor;->mLoadListener:Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;

    return-object v0
.end method

.method static synthetic access$200(Ljp/wasabeef/richeditor/RichEditor;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Ljp/wasabeef/richeditor/RichEditor;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->callback(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Ljp/wasabeef/richeditor/RichEditor;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Ljp/wasabeef/richeditor/RichEditor;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->stateCheck(Ljava/lang/String;)V

    return-void
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 140
    const/4 v3, 0x1

    new-array v0, v3, [I

    const v3, 0x10100af

    aput v3, v0, v4

    .line 143
    .local v0, "attrsArray":[I
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 145
    .local v2, "ta":Landroid/content/res/TypedArray;
    const/4 v3, -0x1

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 146
    .local v1, "gravity":I
    sparse-switch v1, :sswitch_data_48

    .line 171
    :goto_15
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 172
    return-void

    .line 148
    :sswitch_19
    const-string v3, "javascript:RE.setTextAlign(\"left\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 151
    :sswitch_1f
    const-string v3, "javascript:RE.setTextAlign(\"right\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 154
    :sswitch_25
    const-string v3, "javascript:RE.setVerticalAlign(\"top\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 157
    :sswitch_2b
    const-string v3, "javascript:RE.setVerticalAlign(\"bottom\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 160
    :sswitch_31
    const-string v3, "javascript:RE.setVerticalAlign(\"middle\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 163
    :sswitch_37
    const-string v3, "javascript:RE.setTextAlign(\"center\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 166
    :sswitch_3d
    const-string v3, "javascript:RE.setVerticalAlign(\"middle\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 167
    const-string v3, "javascript:RE.setTextAlign(\"center\")"

    invoke-virtual {p0, v3}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    goto :goto_15

    .line 146
    :sswitch_data_48
    .sparse-switch
        0x1 -> :sswitch_37
        0x3 -> :sswitch_19
        0x5 -> :sswitch_1f
        0x10 -> :sswitch_31
        0x11 -> :sswitch_3d
        0x30 -> :sswitch_25
        0x50 -> :sswitch_2b
    .end sparse-switch
.end method

.method private callback(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 119
    const-string v0, "re-callback://"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljp/wasabeef/richeditor/RichEditor;->mContents:Ljava/lang/String;

    .line 120
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor;->mTextChangeListener:Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;

    if-eqz v0, :cond_15

    .line 121
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor;->mTextChangeListener:Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;

    iget-object v1, p0, Ljp/wasabeef/richeditor/RichEditor;->mContents:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;->onTextChange(Ljava/lang/String;)V

    .line 123
    :cond_15
    return-void
.end method

.method private convertHexColorString(I)Ljava/lang/String;
    .registers 6
    .param p1, "color"    # I

    .prologue
    .line 381
    const-string v0, "#%06X"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const v3, 0xffffff

    and-int/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private load(Ljava/lang/String;)V
    .registers 4
    .param p1, "trigger"    # Ljava/lang/String;

    .prologue
    .line 397
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 398
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ljp/wasabeef/richeditor/RichEditor;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 402
    :goto_a
    return-void

    .line 400
    :cond_b
    invoke-virtual {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->loadUrl(Ljava/lang/String;)V

    goto :goto_a
.end method

.method private stateCheck(Ljava/lang/String;)V
    .registers 10
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 126
    const-string v3, "re-state://"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "state":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .local v2, "types":Ljava/util/List;, "Ljava/util/List<Ljp/wasabeef/richeditor/RichEditor$Type;>;"
    invoke-static {}, Ljp/wasabeef/richeditor/RichEditor$Type;->values()[Ljp/wasabeef/richeditor/RichEditor$Type;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_19
    if-ge v3, v5, :cond_2e

    aget-object v1, v4, v3

    .line 129
    .local v1, "type":Ljp/wasabeef/richeditor/RichEditor$Type;
    invoke-virtual {v1}, Ljp/wasabeef/richeditor/RichEditor$Type;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_2b

    .line 130
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    :cond_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 134
    .end local v1    # "type":Ljp/wasabeef/richeditor/RichEditor$Type;
    :cond_2e
    iget-object v3, p0, Ljp/wasabeef/richeditor/RichEditor;->mDecorationStateListener:Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;

    if-eqz v3, :cond_37

    .line 135
    iget-object v3, p0, Ljp/wasabeef/richeditor/RichEditor;->mDecorationStateListener:Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;

    invoke-interface {v3, v0, v2}, Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;->onStateChangeListener(Ljava/lang/String;Ljava/util/List;)V

    .line 137
    :cond_37
    return-void
.end method


# virtual methods
.method public clearFocusEditor()V
    .registers 2

    .prologue
    .line 377
    const-string v0, "javascript:RE.blurFocus();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 378
    return-void
.end method

.method protected createWebviewClient()Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;
    .registers 2

    .prologue
    .line 103
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;

    invoke-direct {v0, p0}, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;-><init>(Ljp/wasabeef/richeditor/RichEditor;)V

    return-object v0
.end method

.method protected exec(Ljava/lang/String;)V
    .registers 5
    .param p1, "trigger"    # Ljava/lang/String;

    .prologue
    .line 385
    iget-boolean v0, p0, Ljp/wasabeef/richeditor/RichEditor;->isReady:Z

    if-eqz v0, :cond_8

    .line 386
    invoke-direct {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->load(Ljava/lang/String;)V

    .line 394
    :goto_7
    return-void

    .line 388
    :cond_8
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$1;

    invoke-direct {v0, p0, p1}, Ljp/wasabeef/richeditor/RichEditor$1;-><init>(Ljp/wasabeef/richeditor/RichEditor;Ljava/lang/String;)V

    const-wide/16 v1, 0x64

    invoke-virtual {p0, v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_7
.end method

.method public focusEditor()V
    .registers 2

    .prologue
    .line 372
    invoke-virtual {p0}, Ljp/wasabeef/richeditor/RichEditor;->requestFocus()Z

    .line 373
    const-string v0, "javascript:RE.focus();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 374
    return-void
.end method

.method public getHtml()Ljava/lang/String;
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor;->mContents:Ljava/lang/String;

    return-object v0
.end method

.method public insertImage(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "alt"    # Ljava/lang/String;

    .prologue
    .line 357
    const-string v0, "javascript:RE.prepareInsert();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 358
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.insertImage(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 359
    return-void
.end method

.method public insertLink(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "href"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 362
    const-string v0, "javascript:RE.prepareInsert();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 363
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.insertLink(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 364
    return-void
.end method

.method public insertTodo()V
    .registers 4

    .prologue
    .line 367
    const-string v0, "javascript:RE.prepareInsert();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setTodo(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljp/wasabeef/richeditor/Utils;->getCurrentTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 369
    return-void
.end method

.method public loadCSS(Ljava/lang/String;)V
    .registers 5
    .param p1, "cssFile"    # Ljava/lang/String;

    .prologue
    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(function() {    var head  = document.getElementsByTagName(\"head\")[0];    var link  = document.createElement(\"link\");    link.rel  = \"stylesheet\";    link.type = \"text/css\";    link.href = \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "    link.media = \"all\";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "    head.appendChild(link);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}) ();"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "jsCSSImport":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 261
    return-void
.end method

.method public redo()V
    .registers 2

    .prologue
    .line 268
    const-string v0, "javascript:RE.redo();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 269
    return-void
.end method

.method public removeFormat()V
    .registers 2

    .prologue
    .line 317
    const-string v0, "javascript:RE.removeFormat();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 318
    return-void
.end method

.method public setAlignCenter()V
    .registers 2

    .prologue
    .line 337
    const-string v0, "javascript:RE.setJustifyCenter();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 338
    return-void
.end method

.method public setAlignLeft()V
    .registers 2

    .prologue
    .line 333
    const-string v0, "javascript:RE.setJustifyLeft();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 334
    return-void
.end method

.method public setAlignRight()V
    .registers 2

    .prologue
    .line 341
    const-string v0, "javascript:RE.setJustifyRight();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 342
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 227
    invoke-static {p1}, Ljp/wasabeef/richeditor/Utils;->toBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 228
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v1}, Ljp/wasabeef/richeditor/Utils;->toBase64(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v0

    .line 229
    .local v0, "base64":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 231
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "javascript:RE.setBackgroundImage(\'url(data:image/png;base64,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")\');"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method public setBackground(Ljava/lang/String;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setBackgroundImage(\'url("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 215
    invoke-super {p0, p1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 216
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 6
    .param p1, "resid"    # I

    .prologue
    .line 219
    invoke-virtual {p0}, Ljp/wasabeef/richeditor/RichEditor;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1}, Ljp/wasabeef/richeditor/Utils;->decodeResource(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 220
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v1}, Ljp/wasabeef/richeditor/Utils;->toBase64(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v0

    .line 221
    .local v0, "base64":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 223
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "javascript:RE.setBackgroundImage(\'url(data:image/png;base64,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")\');"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 224
    return-void
.end method

.method public setBlockquote()V
    .registers 2

    .prologue
    .line 345
    const-string v0, "javascript:RE.setBlockquote();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 346
    return-void
.end method

.method public setBold()V
    .registers 2

    .prologue
    .line 272
    const-string v0, "javascript:RE.setBold();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 273
    return-void
.end method

.method public setBullets()V
    .registers 2

    .prologue
    .line 349
    const-string v0, "javascript:RE.setBullets();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 350
    return-void
.end method

.method public setEditorBackgroundColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 211
    invoke-virtual {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->setBackgroundColor(I)V

    .line 212
    return-void
.end method

.method public setEditorFontColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 191
    invoke-direct {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->convertHexColorString(I)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "hex":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:RE.setBaseTextColor(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method public setEditorFontSize(I)V
    .registers 4
    .param p1, "px"    # I

    .prologue
    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setBaseFontSize(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public setEditorHeight(I)V
    .registers 4
    .param p1, "px"    # I

    .prologue
    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setHeight(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 244
    return-void
.end method

.method public setEditorWidth(I)V
    .registers 4
    .param p1, "px"    # I

    .prologue
    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setWidth(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 240
    return-void
.end method

.method public setFontSize(I)V
    .registers 4
    .param p1, "fontSize"    # I

    .prologue
    .line 310
    const/4 v0, 0x7

    if-gt p1, v0, :cond_6

    const/4 v0, 0x1

    if-ge p1, v0, :cond_d

    .line 311
    :cond_6
    const-string v0, "RichEditor"

    const-string v1, "Font size should have a value between 1-7"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setFontSize(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 314
    return-void
.end method

.method public setHeading(I)V
    .registers 4
    .param p1, "heading"    # I

    .prologue
    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setHeading(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 322
    return-void
.end method

.method public setHtml(Ljava/lang/String;)V
    .registers 4
    .param p1, "contents"    # Ljava/lang/String;

    .prologue
    .line 175
    if-nez p1, :cond_4

    .line 176
    const-string p1, ""

    .line 179
    :cond_4
    :try_start_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setHtml(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V
    :try_end_26
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_26} :catch_29

    .line 183
    :goto_26
    iput-object p1, p0, Ljp/wasabeef/richeditor/RichEditor;->mContents:Ljava/lang/String;

    .line 184
    return-void

    .line 180
    :catch_29
    move-exception v0

    goto :goto_26
.end method

.method public setIndent()V
    .registers 2

    .prologue
    .line 325
    const-string v0, "javascript:RE.setIndent();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 326
    return-void
.end method

.method public setItalic()V
    .registers 2

    .prologue
    .line 276
    const-string v0, "javascript:RE.setItalic();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 277
    return-void
.end method

.method public setNumbers()V
    .registers 2

    .prologue
    .line 353
    const-string v0, "javascript:RE.setNumbers();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 354
    return-void
.end method

.method public setOnDecorationChangeListener(Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;)V
    .registers 2
    .param p1, "listener"    # Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;

    .prologue
    .line 111
    iput-object p1, p0, Ljp/wasabeef/richeditor/RichEditor;->mDecorationStateListener:Ljp/wasabeef/richeditor/RichEditor$OnDecorationStateListener;

    .line 112
    return-void
.end method

.method public setOnInitialLoadListener(Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;)V
    .registers 2
    .param p1, "listener"    # Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;

    .prologue
    .line 115
    iput-object p1, p0, Ljp/wasabeef/richeditor/RichEditor;->mLoadListener:Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;

    .line 116
    return-void
.end method

.method public setOnTextChangeListener(Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;)V
    .registers 2
    .param p1, "listener"    # Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;

    .prologue
    .line 107
    iput-object p1, p0, Ljp/wasabeef/richeditor/RichEditor;->mTextChangeListener:Ljp/wasabeef/richeditor/RichEditor$OnTextChangeListener;

    .line 108
    return-void
.end method

.method public setOutdent()V
    .registers 2

    .prologue
    .line 329
    const-string v0, "javascript:RE.setOutdent();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 330
    return-void
.end method

.method public setPadding(IIII)V
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 200
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebView;->setPadding(IIII)V

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setPadding(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "px\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method public setPaddingRelative(IIII)V
    .registers 5
    .param p1, "start"    # I
    .param p2, "top"    # I
    .param p3, "end"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 207
    invoke-virtual {p0, p1, p2, p3, p4}, Ljp/wasabeef/richeditor/RichEditor;->setPadding(IIII)V

    .line 208
    return-void
.end method

.method public setPlaceholder(Ljava/lang/String;)V
    .registers 4
    .param p1, "placeholder"    # Ljava/lang/String;

    .prologue
    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:RE.setPlaceholder(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 248
    return-void
.end method

.method public setStrikeThrough()V
    .registers 2

    .prologue
    .line 288
    const-string v0, "javascript:RE.setStrikeThrough();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 289
    return-void
.end method

.method public setSubscript()V
    .registers 2

    .prologue
    .line 280
    const-string v0, "javascript:RE.setSubscript();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 281
    return-void
.end method

.method public setSuperscript()V
    .registers 2

    .prologue
    .line 284
    const-string v0, "javascript:RE.setSuperscript();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 285
    return-void
.end method

.method public setTextBackgroundColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 303
    const-string v1, "javascript:RE.prepareInsert();"

    invoke-virtual {p0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 305
    invoke-direct {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->convertHexColorString(I)Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "hex":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:RE.setTextBackgroundColor(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 307
    return-void
.end method

.method public setTextColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 296
    const-string v1, "javascript:RE.prepareInsert();"

    invoke-virtual {p0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 298
    invoke-direct {p0, p1}, Ljp/wasabeef/richeditor/RichEditor;->convertHexColorString(I)Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, "hex":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:RE.setTextColor(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 300
    return-void
.end method

.method public setUnderline()V
    .registers 2

    .prologue
    .line 292
    const-string v0, "javascript:RE.setUnderline();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 293
    return-void
.end method

.method public undo()V
    .registers 2

    .prologue
    .line 264
    const-string v0, "javascript:RE.undo();"

    invoke-virtual {p0, v0}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 265
    return-void
.end method
