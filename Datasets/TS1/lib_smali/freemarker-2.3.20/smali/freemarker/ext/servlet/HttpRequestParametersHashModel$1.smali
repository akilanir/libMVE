.class Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;
.super Ljava/lang/Object;
.source "HttpRequestParametersHashModel.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private final this$0:Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

.field private final val$iter:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lfreemarker/ext/servlet/HttpRequestParametersHashModel;Ljava/util/Iterator;)V
    .registers 3

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;->this$0:Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

    iput-object p2, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;->val$iter:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;->this$0:Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

    invoke-static {v0}, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->access$000(Lfreemarker/ext/servlet/HttpRequestParametersHashModel;)Ljavax/servlet/http/HttpServletRequest;

    move-result-object v1

    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v0}, Ljavax/servlet/http/HttpServletRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
