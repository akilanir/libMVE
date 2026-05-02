.class final Lfreemarker/template/GeneralPurposeNothing;
.super Ljava/lang/Object;
.source "GeneralPurposeNothing.java"

# interfaces
.implements Lfreemarker/template/TemplateBooleanModel;
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateHashModelEx;
.implements Lfreemarker/template/TemplateMethodModelEx;


# static fields
.field private static final EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

.field private static final instance:Lfreemarker/template/TemplateModel;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 69
    new-instance v0, Lfreemarker/template/GeneralPurposeNothing;

    invoke-direct {v0}, Lfreemarker/template/GeneralPurposeNothing;-><init>()V

    sput-object v0, Lfreemarker/template/GeneralPurposeNothing;->instance:Lfreemarker/template/TemplateModel;

    .line 71
    new-instance v0, Lfreemarker/template/SimpleCollection;

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lfreemarker/template/GeneralPurposeNothing;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method

.method static getInstance()Lfreemarker/template/TemplateModel;
    .registers 1

    .prologue
    .line 77
    sget-object v0, Lfreemarker/template/GeneralPurposeNothing;->instance:Lfreemarker/template/TemplateModel;

    return-object v0
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "args"    # Ljava/util/List;

    .prologue
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "Empty list"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 101
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAsBoolean()Z
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    const-string v0, ""

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x1

    return v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 2

    .prologue
    .line 109
    sget-object v0, Lfreemarker/template/GeneralPurposeNothing;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 2

    .prologue
    .line 113
    sget-object v0, Lfreemarker/template/GeneralPurposeNothing;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method
