.class public Lorg/ligi/axt/extensions/ContextAXT;
.super Ljava/lang/Object;
.source "ContextAXT.java"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/ligi/axt/extensions/ContextAXT;->context:Landroid/content/Context;

    .line 14
    return-void
.end method


# virtual methods
.method public forceOverFlowMenuEvenThoughDeviceHasPhysical()V
    .registers 5

    .prologue
    .line 26
    :try_start_0
    iget-object v2, p0, Lorg/ligi/axt/extensions/ContextAXT;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 27
    .local v0, "config":Landroid/view/ViewConfiguration;
    const-class v2, Landroid/view/ViewConfiguration;

    const-string v3, "sHasPermanentMenuKey"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 28
    .local v1, "menuKeyField":Ljava/lang/reflect/Field;
    if-eqz v1, :cond_18

    .line 29
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 30
    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_18} :catch_19

    .line 35
    .end local v0    # "config":Landroid/view/ViewConfiguration;
    .end local v1    # "menuKeyField":Ljava/lang/reflect/Field;
    :cond_18
    :goto_18
    return-void

    .line 32
    :catch_19
    move-exception v2

    goto :goto_18
.end method

.method public startCommonIntent()Lorg/ligi/axt/extensions/misc/CommonIntentStarter;
    .registers 3

    .prologue
    .line 38
    new-instance v0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;

    iget-object v1, p0, Lorg/ligi/axt/extensions/ContextAXT;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
