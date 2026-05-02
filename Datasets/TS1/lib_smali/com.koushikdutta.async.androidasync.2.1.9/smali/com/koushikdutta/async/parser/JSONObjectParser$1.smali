.class Lcom/koushikdutta/async/parser/JSONObjectParser$1;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "JSONObjectParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/parser/JSONObjectParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Lorg/json/JSONObject;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/parser/JSONObjectParser;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/parser/JSONObjectParser;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/parser/JSONObjectParser;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/koushikdutta/async/parser/JSONObjectParser$1;->this$0:Lcom/koushikdutta/async/parser/JSONObjectParser;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/parser/JSONObjectParser$1;->transform(Ljava/lang/String;)V

    return-void
.end method

.method protected transform(Ljava/lang/String;)V
    .registers 3
    .param p1, "result"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/parser/JSONObjectParser$1;->setComplete(Ljava/lang/Object;)Z

    .line 23
    return-void
.end method
