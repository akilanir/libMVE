.class public Lus/feras/mdv/MarkdownView;
.super Landroid/webkit/WebView;
.source "MarkdownView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lus/feras/mdv/MarkdownView$1;,
        Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MarkdownView"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    return-void
.end method

.method static synthetic access$100(Lus/feras/mdv/MarkdownView;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lus/feras/mdv/MarkdownView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lus/feras/mdv/MarkdownView;->readFileFromAsset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lus/feras/mdv/MarkdownView;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lus/feras/mdv/MarkdownView;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lus/feras/mdv/MarkdownView;->loadMarkdownToView(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private loadMarkdownToView(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "txt"    # Ljava/lang/String;
    .param p2, "cssFileUrl"    # Ljava/lang/String;

    .prologue
    .line 136
    new-instance v6, Lorg/markdownj/MarkdownProcessor;

    invoke-direct {v6}, Lorg/markdownj/MarkdownProcessor;-><init>()V

    .line 137
    .local v6, "m":Lorg/markdownj/MarkdownProcessor;
    invoke-virtual {v6, p1}, Lorg/markdownj/MarkdownProcessor;->markdown(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 138
    .local v2, "html":Ljava/lang/String;
    if-eqz p2, :cond_28

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<link rel=\'stylesheet\' type=\'text/css\' href=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' />"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 141
    :cond_28
    const-string v1, "fake://"

    const-string v3, "text/html"

    const-string v4, "UTF-8"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lus/feras/mdv/MarkdownView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method private readFileFromAsset(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 81
    :try_start_0
    invoke-virtual {p0}, Lus/feras/mdv/MarkdownView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_37

    move-result-object v3

    .line 83
    .local v3, "input":Ljava/io/InputStream;
    :try_start_c
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 84
    .local v0, "bufferedReader":Ljava/io/BufferedReader;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/io/InputStream;->available()I

    move-result v5

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 86
    .local v1, "content":Ljava/lang/StringBuilder;
    :goto_1f
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_41

    .line 87
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    const-string v5, "line.separator"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_31
    .catchall {:try_start_c .. :try_end_31} :catchall_32

    goto :goto_1f

    .line 91
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v1    # "content":Ljava/lang/StringBuilder;
    .end local v4    # "line":Ljava/lang/String;
    :catchall_32
    move-exception v5

    :try_start_33
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v5
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_37} :catch_37

    .line 92
    .end local v3    # "input":Ljava/io/InputStream;
    :catch_37
    move-exception v2

    .line 93
    .local v2, "ex":Ljava/lang/Exception;
    const-string v5, "MarkdownView"

    const-string v6, "Error while reading file from assets"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    const/4 v5, 0x0

    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_40
    return-object v5

    .line 90
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "content":Ljava/lang/StringBuilder;
    .restart local v3    # "input":Ljava/io/InputStream;
    .restart local v4    # "line":Ljava/lang/String;
    :cond_41
    :try_start_41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_32

    move-result-object v5

    .line 91
    :try_start_45
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_48} :catch_37

    goto :goto_40
.end method


# virtual methods
.method public loadMarkdown(Ljava/lang/String;)V
    .registers 3
    .param p1, "txt"    # Ljava/lang/String;

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lus/feras/mdv/MarkdownView;->loadMarkdown(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public loadMarkdown(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "txt"    # Ljava/lang/String;
    .param p2, "cssFileUrl"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lus/feras/mdv/MarkdownView;->loadMarkdownToView(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public loadMarkdownFile(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lus/feras/mdv/MarkdownView;->loadMarkdownFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public loadMarkdownFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "cssFileUrl"    # Ljava/lang/String;

    .prologue
    .line 72
    new-instance v0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;-><init>(Lus/feras/mdv/MarkdownView;Lus/feras/mdv/MarkdownView$1;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 73
    return-void
.end method
