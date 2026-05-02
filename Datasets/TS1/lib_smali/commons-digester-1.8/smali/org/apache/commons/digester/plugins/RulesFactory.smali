.class public abstract Lorg/apache/commons/digester/plugins/RulesFactory;
.super Ljava/lang/Object;
.source "RulesFactory.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract newRules(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;)Lorg/apache/commons/digester/Rules;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation
.end method
