.class final Lfreemarker/template/utility/Constants$4;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 141
    const/4 v0, 0x1

    return v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 129
    sget-object v0, Lfreemarker/template/utility/Constants;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

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
    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 133
    sget-object v0, Lfreemarker/template/utility/Constants;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method
