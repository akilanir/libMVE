.class Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;
.super Ljavax/servlet/jsp/tagext/JspFragment;
.source "SimpleTagDirectiveModel.java"


# instance fields
.field private final this$0:Lfreemarker/ext/jsp/SimpleTagDirectiveModel;

.field private final val$body:Lfreemarker/template/TemplateDirectiveBody;

.field private final val$pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/SimpleTagDirectiveModel;Lfreemarker/ext/jsp/FreeMarkerPageContext;Lfreemarker/template/TemplateDirectiveBody;)V
    .registers 4

    .prologue
    .line 52
    invoke-direct {p0}, Ljavax/servlet/jsp/tagext/JspFragment;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;->this$0:Lfreemarker/ext/jsp/SimpleTagDirectiveModel;

    iput-object p2, p0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;->val$pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    iput-object p3, p0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;->val$body:Lfreemarker/template/TemplateDirectiveBody;

    return-void
.end method


# virtual methods
.method public getJspContext()Ljavax/servlet/jsp/JspContext;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;->val$pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    return-object v0
.end method

.method public invoke(Ljava/io/Writer;)V
    .registers 5
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;->val$body:Lfreemarker/template/TemplateDirectiveBody;

    if-nez p1, :cond_a

    iget-object v2, p0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;->val$pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    invoke-virtual {v2}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getOut()Ljavax/servlet/jsp/JspWriter;

    move-result-object p1

    .end local p1    # "out":Ljava/io/Writer;
    :cond_a
    invoke-interface {v1, p1}, Lfreemarker/template/TemplateDirectiveBody;->render(Ljava/io/Writer;)V
    :try_end_d
    .catch Lfreemarker/template/TemplateException; {:try_start_0 .. :try_end_d} :catch_e

    .line 64
    return-void

    .line 61
    :catch_e
    move-exception v0

    .line 62
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v1, Ljavax/servlet/jsp/JspException;

    invoke-direct {v1, v0}, Ljavax/servlet/jsp/JspException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
