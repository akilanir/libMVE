.class final Lcom/koushikdutta/async/Util$1;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/CompletedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/Util;->pump(Ljava/io/InputStream;JLcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field reported:Z

.field final synthetic val$callback:Lcom/koushikdutta/async/callback/CompletedCallback;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 2

    .prologue
    .line 63
    iput-object p1, p0, Lcom/koushikdutta/async/Util$1;->val$callback:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/koushikdutta/async/Util$1;->reported:Z

    if-eqz v0, :cond_5

    .line 71
    :goto_4
    return-void

    .line 69
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/Util$1;->reported:Z

    .line 70
    iget-object v0, p0, Lcom/koushikdutta/async/Util$1;->val$callback:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_4
.end method
