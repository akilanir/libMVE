.class Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReconfiguringThread"
.end annotation


# instance fields
.field final synthetic this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;


# direct methods
.method constructor <init>(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private fallbackConfiguration(Lch/qos/logback/classic/LoggerContext;Ljava/util/List;Ljava/net/URL;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/classic/LoggerContext;",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;",
            "Ljava/net/URL;",
            ")V"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/classic/joran/JoranConfigurator;

    invoke-direct {v0}, Lch/qos/logback/classic/joran/JoranConfigurator;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$500(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/joran/JoranConfigurator;->setContext(Lch/qos/logback/core/Context;)V

    if-eqz p2, :cond_3a

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    const-string v2, "Falling back to previously registered safe configuration."

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addWarn(Ljava/lang/String;)V

    :try_start_17
    invoke-virtual {p1}, Lch/qos/logback/classic/LoggerContext;->reset()V

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$600(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-static {v1, p3}, Lch/qos/logback/classic/joran/JoranConfigurator;->informContextOfURLUsedForConfiguration(Lch/qos/logback/core/Context;Ljava/net/URL;)V

    invoke-virtual {v0, p2}, Lch/qos/logback/classic/joran/JoranConfigurator;->doConfigure(Ljava/util/List;)V

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    const-string v2, "Re-registering previous fallback configuration once more as a fallback configuration point"

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addInfo(Ljava/lang/String;)V

    invoke-virtual {v0}, Lch/qos/logback/classic/joran/JoranConfigurator;->registerSafeConfiguration()V
    :try_end_30
    .catch Lch/qos/logback/core/joran/spi/JoranException; {:try_start_17 .. :try_end_30} :catch_31

    :goto_30
    return-void

    :catch_31
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    const-string v2, "Unexpected exception thrown by a configuration considered safe."

    invoke-virtual {v1, v2, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_30

    :cond_3a
    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    const-string v1, "No previous configuration to fall back on."

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addWarn(Ljava/lang/String;)V

    goto :goto_30
.end method

.method private performXMLConfiguration(Lch/qos/logback/classic/LoggerContext;)V
    .registers 9

    new-instance v0, Lch/qos/logback/classic/joran/JoranConfigurator;

    invoke-direct {v0}, Lch/qos/logback/classic/joran/JoranConfigurator;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$200(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/joran/JoranConfigurator;->setContext(Lch/qos/logback/core/Context;)V

    new-instance v1, Lch/qos/logback/core/status/StatusUtil;

    iget-object v2, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$300(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lch/qos/logback/core/status/StatusUtil;-><init>(Lch/qos/logback/core/Context;)V

    invoke-virtual {v0}, Lch/qos/logback/classic/joran/JoranConfigurator;->recallSafeConfiguration()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v3}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$400(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v3

    invoke-static {v3}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->getMainWatchURL(Lch/qos/logback/core/Context;)Ljava/net/URL;

    move-result-object v3

    invoke-virtual {p1}, Lch/qos/logback/classic/LoggerContext;->reset()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    :try_start_2e
    iget-object v6, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    iget-object v6, v6, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mainConfigurationURL:Ljava/net/URL;

    invoke-virtual {v0, v6}, Lch/qos/logback/classic/joran/JoranConfigurator;->doConfigure(Ljava/net/URL;)V

    invoke-virtual {v1, v4, v5}, Lch/qos/logback/core/status/StatusUtil;->hasXMLParsingErrors(J)Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-direct {p0, p1, v2, v3}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->fallbackConfiguration(Lch/qos/logback/classic/LoggerContext;Ljava/util/List;Ljava/net/URL;)V
    :try_end_3e
    .catch Lch/qos/logback/core/joran/spi/JoranException; {:try_start_2e .. :try_end_3e} :catch_3f

    :cond_3e
    :goto_3e
    return-void

    :catch_3f
    move-exception v0

    invoke-direct {p0, p1, v2, v3}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->fallbackConfiguration(Lch/qos/logback/classic/LoggerContext;Ljava/util/List;Ljava/net/URL;)V

    goto :goto_3e
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    iget-object v0, v0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mainConfigurationURL:Ljava/net/URL;

    if-nez v0, :cond_e

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    const-string v1, "Due to missing top level configuration file, skipping reconfiguration"

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addInfo(Ljava/lang/String;)V

    :cond_d
    :goto_d
    return-void

    :cond_e
    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$000(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Will reset and reconfigure context named ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    # getter for: Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;
    invoke-static {v3}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->access$100(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;

    move-result-object v3

    invoke-interface {v3}, Lch/qos/logback/core/Context;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addInfo(Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->this$0:Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    iget-object v1, v1, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mainConfigurationURL:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "xml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-direct {p0, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;->performXMLConfiguration(Lch/qos/logback/classic/LoggerContext;)V

    goto :goto_d
.end method
