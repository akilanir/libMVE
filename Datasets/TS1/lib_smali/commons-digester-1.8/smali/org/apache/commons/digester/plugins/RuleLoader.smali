.class public abstract Lorg/apache/commons/digester/plugins/RuleLoader;
.super Ljava/lang/Object;
.source "RuleLoader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract addRules(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation
.end method
