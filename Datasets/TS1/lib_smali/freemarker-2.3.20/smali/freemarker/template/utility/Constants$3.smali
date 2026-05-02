.class final Lfreemarker/template/utility/Constants$3;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v0, 0x0

    return-object v0
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 117
    const/4 v0, 0x0

    return v0
.end method
