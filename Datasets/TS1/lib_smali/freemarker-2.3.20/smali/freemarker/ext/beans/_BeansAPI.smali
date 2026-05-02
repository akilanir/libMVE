.class public Lfreemarker/ext/beans/_BeansAPI;
.super Ljava/lang/Object;
.source "_BeansAPI.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAsClassicCompatibleString(Lfreemarker/ext/beans/BeanModel;)Ljava/lang/String;
    .registers 2
    .param p0, "bm"    # Lfreemarker/ext/beans/BeanModel;

    .prologue
    .line 13
    invoke-virtual {p0}, Lfreemarker/ext/beans/BeanModel;->getAsClassicCompatibleString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
