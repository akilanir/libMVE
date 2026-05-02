.class public Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "RichEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/wasabeef/richeditor/RichEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EditorWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Ljp/wasabeef/richeditor/RichEditor;


# direct methods
.method protected constructor <init>(Ljp/wasabeef/richeditor/RichEditor;)V
    .registers 2
    .param p1, "this$0"    # Ljp/wasabeef/richeditor/RichEditor;

    .prologue
    .line 404
    iput-object p1, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 406
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    const-string v1, "file:///android_asset/editor.html"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    # setter for: Ljp/wasabeef/richeditor/RichEditor;->isReady:Z
    invoke-static {v0, v1}, Ljp/wasabeef/richeditor/RichEditor;->access$002(Ljp/wasabeef/richeditor/RichEditor;Z)Z

    .line 407
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    # getter for: Ljp/wasabeef/richeditor/RichEditor;->mLoadListener:Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;
    invoke-static {v0}, Ljp/wasabeef/richeditor/RichEditor;->access$100(Ljp/wasabeef/richeditor/RichEditor;)Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 408
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    # getter for: Ljp/wasabeef/richeditor/RichEditor;->mLoadListener:Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;
    invoke-static {v0}, Ljp/wasabeef/richeditor/RichEditor;->access$100(Ljp/wasabeef/richeditor/RichEditor;)Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;

    move-result-object v0

    iget-object v1, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    # getter for: Ljp/wasabeef/richeditor/RichEditor;->isReady:Z
    invoke-static {v1}, Ljp/wasabeef/richeditor/RichEditor;->access$000(Ljp/wasabeef/richeditor/RichEditor;)Z

    move-result v1

    invoke-interface {v0, v1}, Ljp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener;->onAfterInitialLoad(Z)V

    .line 410
    :cond_22
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 415
    :try_start_1
    const-string v3, "UTF-8"

    invoke-static {p2, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_6} :catch_15

    move-result-object v0

    .line 421
    .local v0, "decode":Ljava/lang/String;
    const-string v3, "re-callback://"

    invoke-static {p2, v3}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v3

    if-nez v3, :cond_18

    .line 422
    iget-object v3, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    # invokes: Ljp/wasabeef/richeditor/RichEditor;->callback(Ljava/lang/String;)V
    invoke-static {v3, v0}, Ljp/wasabeef/richeditor/RichEditor;->access$200(Ljp/wasabeef/richeditor/RichEditor;Ljava/lang/String;)V

    .line 429
    .end local v0    # "decode":Ljava/lang/String;
    :goto_14
    return v2

    .line 416
    :catch_15
    move-exception v1

    .line 418
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    const/4 v2, 0x0

    goto :goto_14

    .line 424
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "decode":Ljava/lang/String;
    :cond_18
    const-string v3, "re-state://"

    invoke-static {p2, v3}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v3

    if-nez v3, :cond_26

    .line 425
    iget-object v3, p0, Ljp/wasabeef/richeditor/RichEditor$EditorWebViewClient;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    # invokes: Ljp/wasabeef/richeditor/RichEditor;->stateCheck(Ljava/lang/String;)V
    invoke-static {v3, v0}, Ljp/wasabeef/richeditor/RichEditor;->access$300(Ljp/wasabeef/richeditor/RichEditor;Ljava/lang/String;)V

    goto :goto_14

    .line 429
    :cond_26
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v2

    goto :goto_14
.end method
