.class Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;
.super Landroid/os/AsyncTask;
.source "MarkdownView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lus/feras/mdv/MarkdownView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadMarkdownUrlTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private cssFileUrl:Ljava/lang/String;

.field final synthetic this$0:Lus/feras/mdv/MarkdownView;


# direct methods
.method private constructor <init>(Lus/feras/mdv/MarkdownView;)V
    .registers 2

    .prologue
    .line 98
    iput-object p1, p0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->this$0:Lus/feras/mdv/MarkdownView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lus/feras/mdv/MarkdownView;Lus/feras/mdv/MarkdownView$1;)V
    .registers 3
    .param p1, "x0"    # Lus/feras/mdv/MarkdownView;
    .param p2, "x1"    # Lus/feras/mdv/MarkdownView$1;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;-><init>(Lus/feras/mdv/MarkdownView;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 98
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 104
    :try_start_0
    const-string v1, ""

    .line 105
    .local v1, "markdown":Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v2, p1, v3

    .line 106
    .local v2, "url":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, p1, v3

    iput-object v3, p0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->cssFileUrl:Ljava/lang/String;

    .line 107
    invoke-static {v2}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 108
    invoke-static {v2}, Lus/feras/mdv/util/HttpHelper;->get(Ljava/lang/String;)Lus/feras/mdv/util/HttpHelper$Response;

    move-result-object v3

    invoke-virtual {v3}, Lus/feras/mdv/util/HttpHelper$Response;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    .line 118
    .end local v1    # "markdown":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    :goto_18
    return-object v1

    .line 109
    .restart local v1    # "markdown":Ljava/lang/String;
    .restart local v2    # "url":Ljava/lang/String;
    :cond_19
    invoke-static {v2}, Landroid/webkit/URLUtil;->isAssetUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 110
    iget-object v3, p0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->this$0:Lus/feras/mdv/MarkdownView;

    const-string v4, "file:///android_asset/"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    # invokes: Lus/feras/mdv/MarkdownView;->readFileFromAsset(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v4}, Lus/feras/mdv/MarkdownView;->access$100(Lus/feras/mdv/MarkdownView;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_18

    .line 112
    :cond_34
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The URL string provided is not a network URL or Asset URL."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3c} :catch_3c

    .line 116
    .end local v1    # "markdown":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    :catch_3c
    move-exception v0

    .line 117
    .local v0, "ex":Ljava/lang/Exception;
    const-string v3, "MarkdownView"

    const-string v4, "Error Loading Markdown File."

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    const/4 v1, 0x0

    goto :goto_18
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 98
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 127
    if-eqz p1, :cond_a

    .line 128
    iget-object v0, p0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->this$0:Lus/feras/mdv/MarkdownView;

    iget-object v1, p0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->cssFileUrl:Ljava/lang/String;

    # invokes: Lus/feras/mdv/MarkdownView;->loadMarkdownToView(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, p1, v1}, Lus/feras/mdv/MarkdownView;->access$200(Lus/feras/mdv/MarkdownView;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :goto_9
    return-void

    .line 130
    :cond_a
    iget-object v0, p0, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->this$0:Lus/feras/mdv/MarkdownView;

    const-string v1, "about:blank"

    invoke-virtual {v0, v1}, Lus/feras/mdv/MarkdownView;->loadUrl(Ljava/lang/String;)V

    goto :goto_9
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .registers 2
    .param p1, "progress"    # [Ljava/lang/Integer;

    .prologue
    .line 124
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 98
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lus/feras/mdv/MarkdownView$LoadMarkdownUrlTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
