.class public abstract Lorg/apache/commons/digester/plugins/RuleFinder;
.super Ljava/lang/Object;
.source "RuleFinder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation
.end method
