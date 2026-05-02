.class Landroid/content/res/XResources$1;
.super Ljava/lang/ThreadLocal;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/res/XResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Ljava/util/LinkedList",
        "<",
        "Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1
    invoke-virtual {p0}, Landroid/content/res/XResources$1;->initialValue()Ljava/util/LinkedList;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/util/LinkedList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    return-object v0
.end method
