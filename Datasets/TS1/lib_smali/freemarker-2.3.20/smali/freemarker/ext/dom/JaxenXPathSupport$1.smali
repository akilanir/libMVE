.class final Lfreemarker/ext/dom/JaxenXPathSupport$1;
.super Lfreemarker/core/CustomAttribute;
.source "JaxenXPathSupport.java"


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lfreemarker/core/CustomAttribute;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected create()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 106
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method
