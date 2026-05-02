.class Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel$1;
.super Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;
.source "RmiDebuggedEnvironmentImpl.java"


# instance fields
.field private final this$0:Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;


# direct methods
.method constructor <init>(Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;)V
    .registers 3

    .prologue
    .line 211
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;-><init>(Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$1;)V

    iput-object p1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel$1;->this$0:Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 219
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel$1;->this$0:Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;

    iget-object v0, v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v0, Lfreemarker/template/Configuration;

    invoke-virtual {v0, p1}, Lfreemarker/template/Configuration;->getSharedVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method keySet()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel$1;->this$0:Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;

    iget-object v0, v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v0, Lfreemarker/template/Configuration;

    invoke-virtual {v0}, Lfreemarker/template/Configuration;->getSharedVariableNames()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
