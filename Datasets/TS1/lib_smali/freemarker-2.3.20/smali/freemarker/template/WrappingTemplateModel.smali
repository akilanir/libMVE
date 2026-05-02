.class public abstract Lfreemarker/template/WrappingTemplateModel;
.super Ljava/lang/Object;
.source "WrappingTemplateModel.java"


# static fields
.field private static defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;


# instance fields
.field private objectWrapper:Lfreemarker/template/ObjectWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    sget-object v0, Lfreemarker/template/DefaultObjectWrapper;->instance:Lfreemarker/template/DefaultObjectWrapper;

    sput-object v0, Lfreemarker/template/WrappingTemplateModel;->defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 95
    sget-object v0, Lfreemarker/template/WrappingTemplateModel;->defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, v0}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 96
    return-void
.end method

.method protected constructor <init>(Lfreemarker/template/ObjectWrapper;)V
    .registers 3
    .param p1, "objectWrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    if-eqz p1, :cond_15

    .end local p1    # "objectWrapper":Lfreemarker/template/ObjectWrapper;
    :goto_5
    iput-object p1, p0, Lfreemarker/template/WrappingTemplateModel;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    .line 107
    iget-object v0, p0, Lfreemarker/template/WrappingTemplateModel;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    if-nez v0, :cond_14

    .line 108
    new-instance v0, Lfreemarker/template/DefaultObjectWrapper;

    invoke-direct {v0}, Lfreemarker/template/DefaultObjectWrapper;-><init>()V

    sput-object v0, Lfreemarker/template/WrappingTemplateModel;->defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;

    iput-object v0, p0, Lfreemarker/template/WrappingTemplateModel;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    .line 110
    :cond_14
    return-void

    .line 105
    .restart local p1    # "objectWrapper":Lfreemarker/template/ObjectWrapper;
    :cond_15
    sget-object p1, Lfreemarker/template/WrappingTemplateModel;->defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;

    goto :goto_5
.end method

.method public static getDefaultObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 1

    .prologue
    .line 87
    sget-object v0, Lfreemarker/template/WrappingTemplateModel;->defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;

    return-object v0
.end method

.method public static setDefaultObjectWrapper(Lfreemarker/template/ObjectWrapper;)V
    .registers 1
    .param p0, "objectWrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 75
    sput-object p0, Lfreemarker/template/WrappingTemplateModel;->defaultObjectWrapper:Lfreemarker/template/ObjectWrapper;

    .line 76
    return-void
.end method


# virtual methods
.method public getObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lfreemarker/template/WrappingTemplateModel;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    return-object v0
.end method

.method public setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V
    .registers 2
    .param p1, "objectWrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 120
    iput-object p1, p0, Lfreemarker/template/WrappingTemplateModel;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    .line 121
    return-void
.end method

.method protected final wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lfreemarker/template/WrappingTemplateModel;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    invoke-interface {v0, p1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method
