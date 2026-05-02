.class Lfreemarker/ext/jsp/TagTransformModel$TagWriter;
.super Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;
.source "TagTransformModel.java"

# interfaces
.implements Lfreemarker/template/TransformControl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TagTransformModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TagWriter"
.end annotation


# instance fields
.field private final needDoublePop:Z

.field private needPop:Z

.field private final pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

.field private final tag:Ljavax/servlet/jsp/tagext/Tag;

.field private final this$0:Lfreemarker/ext/jsp/TagTransformModel;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/TagTransformModel;Ljava/io/Writer;Ljavax/servlet/jsp/tagext/Tag;Lfreemarker/ext/jsp/FreeMarkerPageContext;Z)V
    .registers 7
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "tag"    # Ljavax/servlet/jsp/tagext/Tag;
    .param p4, "pageContext"    # Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .param p5, "needDoublePop"    # Z

    .prologue
    .line 334
    check-cast p2, Ljavax/servlet/jsp/JspWriter;

    .end local p2    # "out":Ljava/io/Writer;
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;-><init>(Ljavax/servlet/jsp/JspWriter;Z)V

    .line 333
    iput-object p1, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->this$0:Lfreemarker/ext/jsp/TagTransformModel;

    .line 329
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needPop:Z

    .line 335
    iput-boolean p5, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needDoublePop:Z

    .line 336
    iput-object p3, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    .line 337
    iput-object p4, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    .line 338
    return-void
.end method

.method private endEvaluation()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    .prologue
    .line 425
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needPop:Z

    if-eqz v0, :cond_c

    .line 426
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    invoke-virtual {v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V

    .line 427
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needPop:Z

    .line 429
    :cond_c
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-interface {v0}, Ljavax/servlet/jsp/tagext/Tag;->doEndTag()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_3f

    .line 430
    invoke-static {}, Lfreemarker/ext/jsp/TagTransformModel;->access$200()Lfreemarker/log/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Tag.SKIP_PAGE was ignored from a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " tag."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    .line 432
    :cond_3f
    return-void
.end method


# virtual methods
.method public afterBody()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 401
    :try_start_1
    iget-object v2, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->this$0:Lfreemarker/ext/jsp/TagTransformModel;

    invoke-static {v2}, Lfreemarker/ext/jsp/TagTransformModel;->access$100(Lfreemarker/ext/jsp/TagTransformModel;)Z

    move-result v2

    if-eqz v2, :cond_55

    .line 402
    iget-object v2, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    check-cast v2, Ljavax/servlet/jsp/tagext/IterationTag;

    invoke-interface {v2}, Ljavax/servlet/jsp/tagext/IterationTag;->doAfterBody()I

    move-result v0

    .line 403
    .local v0, "dab":I
    packed-switch v0, :pswitch_data_5a

    .line 412
    :pswitch_14
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Unexpected return value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ".doAfterBody()"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_47
    .catch Ljavax/servlet/jsp/JspException; {:try_start_1 .. :try_end_47} :catch_47

    .line 419
    .end local v0    # "dab":I
    :catch_47
    move-exception v1

    .line 420
    .local v1, "e":Ljavax/servlet/jsp/JspException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 405
    .end local v1    # "e":Ljavax/servlet/jsp/JspException;
    .restart local v0    # "dab":I
    :pswitch_4e
    :try_start_4e
    invoke-direct {p0}, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->endEvaluation()V

    move v2, v3

    .line 417
    .end local v0    # "dab":I
    :goto_52
    return v2

    .line 409
    .restart local v0    # "dab":I
    :pswitch_53
    const/4 v2, 0x0

    goto :goto_52

    .line 416
    .end local v0    # "dab":I
    :cond_55
    invoke-direct {p0}, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->endEvaluation()V
    :try_end_58
    .catch Ljavax/servlet/jsp/JspException; {:try_start_4e .. :try_end_58} :catch_47

    move v2, v3

    .line 417
    goto :goto_52

    .line 403
    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_4e
        :pswitch_14
        :pswitch_53
    .end packed-switch
.end method

.method public close()V
    .registers 3

    .prologue
    .line 444
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needPop:Z

    if-eqz v0, :cond_9

    .line 445
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    invoke-virtual {v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V

    .line 447
    :cond_9
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    invoke-virtual {v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popTopTag()V

    .line 449
    :try_start_e
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->this$0:Lfreemarker/ext/jsp/TagTransformModel;

    invoke-static {v0}, Lfreemarker/ext/jsp/TagTransformModel;->access$300(Lfreemarker/ext/jsp/TagTransformModel;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 450
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    check-cast v0, Ljavax/servlet/jsp/tagext/TryCatchFinally;

    invoke-interface {v0}, Ljavax/servlet/jsp/tagext/TryCatchFinally;->doFinally()V

    .line 453
    :cond_1d
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-interface {v0}, Ljavax/servlet/jsp/tagext/Tag;->release()V
    :try_end_22
    .catchall {:try_start_e .. :try_end_22} :catchall_2c

    .line 456
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needDoublePop:Z

    if-eqz v0, :cond_2b

    .line 457
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    invoke-virtual {v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V

    .line 460
    :cond_2b
    return-void

    .line 456
    :catchall_2c
    move-exception v0

    iget-boolean v1, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->needDoublePop:Z

    if-eqz v1, :cond_36

    .line 457
    iget-object v1, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    invoke-virtual {v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V

    :cond_36
    throw v0
.end method

.method getPageContext()Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .registers 2

    .prologue
    .line 351
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->pageContext:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    return-object v0
.end method

.method getTag()Ljavax/servlet/jsp/tagext/Tag;
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    return-object v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 435
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->this$0:Lfreemarker/ext/jsp/TagTransformModel;

    invoke-static {v0}, Lfreemarker/ext/jsp/TagTransformModel;->access$300(Lfreemarker/ext/jsp/TagTransformModel;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 436
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    check-cast v0, Ljavax/servlet/jsp/tagext/TryCatchFinally;

    invoke-interface {v0, p1}, Ljavax/servlet/jsp/tagext/TryCatchFinally;->doCatch(Ljava/lang/Throwable;)V

    .line 441
    return-void

    .line 439
    :cond_10
    throw p1
.end method

.method public onStart()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 359
    :try_start_0
    iget-object v3, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-interface {v3}, Ljavax/servlet/jsp/tagext/Tag;->doStartTag()I

    move-result v1

    .line 360
    .local v1, "dst":I
    packed-switch v1, :pswitch_data_8c

    .line 387
    :pswitch_9
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Illegal return value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ".doStartTag()"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3c
    .catch Ljavax/servlet/jsp/JspException; {:try_start_0 .. :try_end_3c} :catch_3c

    .line 391
    .end local v1    # "dst":I
    :catch_3c
    move-exception v2

    .line 392
    .local v2, "e":Ljavax/servlet/jsp/JspException;
    new-instance v3, Lfreemarker/template/TemplateModelException;

    invoke-virtual {v2}, Ljavax/servlet/jsp/JspException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 368
    .end local v2    # "e":Ljavax/servlet/jsp/JspException;
    .restart local v1    # "dst":I
    :pswitch_47
    :try_start_47
    invoke-direct {p0}, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->endEvaluation()V

    .line 369
    const/4 v3, 0x0

    .line 384
    :goto_4b
    return v3

    .line 372
    :pswitch_4c
    iget-object v3, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->this$0:Lfreemarker/ext/jsp/TagTransformModel;

    invoke-static {v3}, Lfreemarker/ext/jsp/TagTransformModel;->access$000(Lfreemarker/ext/jsp/TagTransformModel;)Z

    move-result v3

    if-eqz v3, :cond_63

    .line 373
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->initBuffer()V

    .line 374
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    check-cast v0, Ljavax/servlet/jsp/tagext/BodyTag;

    .line 375
    .local v0, "btag":Ljavax/servlet/jsp/tagext/BodyTag;
    invoke-interface {v0, p0}, Ljavax/servlet/jsp/tagext/BodyTag;->setBodyContent(Ljavax/servlet/jsp/tagext/BodyContent;)V

    .line 376
    invoke-interface {v0}, Ljavax/servlet/jsp/tagext/BodyTag;->doInitBody()V

    .line 384
    .end local v0    # "btag":Ljavax/servlet/jsp/tagext/BodyTag;
    :pswitch_61
    const/4 v3, 0x1

    goto :goto_4b

    .line 379
    :cond_63
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Can\'t buffer body since "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " does not implement BodyTag."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_8c
    .catch Ljavax/servlet/jsp/JspException; {:try_start_47 .. :try_end_8c} :catch_3c

    .line 360
    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_47
        :pswitch_61
        :pswitch_4c
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_47
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 341
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "TagWriter for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->tag:Ljavax/servlet/jsp/tagext/Tag;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " wrapping a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;->getEnclosingWriter()Ljavax/servlet/jsp/JspWriter;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
