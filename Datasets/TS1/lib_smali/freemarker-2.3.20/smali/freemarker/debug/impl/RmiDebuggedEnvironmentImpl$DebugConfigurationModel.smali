.class Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;
.super Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;
.source "RmiDebuggedEnvironmentImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DebugConfigurationModel"
.end annotation


# static fields
.field private static final KEYS:Ljava/util/List;


# instance fields
.field private sharedVariables:Lfreemarker/template/TemplateModel;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 208
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->KEYS:Ljava/util/List;

    const-string v1, "sharedVariables"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-static {v0, v1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->composeList(Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->KEYS:Ljava/util/List;

    return-void
.end method

.method constructor <init>(Lfreemarker/template/Configuration;)V
    .registers 3
    .param p1, "config"    # Lfreemarker/template/Configuration;

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;-><init>(Lfreemarker/core/Configurable;)V

    .line 210
    new-instance v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel$1;

    invoke-direct {v0, p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel$1;-><init>(Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;)V

    iput-object v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->sharedVariables:Lfreemarker/template/TemplateModel;

    .line 226
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
    .line 235
    const-string v0, "sharedVariables"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 237
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->sharedVariables:Lfreemarker/template/TemplateModel;

    .line 241
    :goto_a
    return-object v0

    :cond_b
    invoke-super {p0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_a
.end method

.method keySet()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 230
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->KEYS:Ljava/util/List;

    return-object v0
.end method
