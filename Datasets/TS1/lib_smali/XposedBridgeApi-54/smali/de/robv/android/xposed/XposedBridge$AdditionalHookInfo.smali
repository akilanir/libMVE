.class Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;
.super Ljava/lang/Object;
.source "XposedBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/XposedBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AdditionalHookInfo"
.end annotation


# instance fields
.field final callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook;",
            ">;"
        }
    .end annotation
.end field

.field final parameterTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field final returnType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;[Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 4
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook;",
            ">;[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 840
    .local p1, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    .local p3, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 841
    iput-object p1, p0, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 842
    iput-object p2, p0, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->parameterTypes:[Ljava/lang/Class;

    .line 843
    iput-object p3, p0, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->returnType:Ljava/lang/Class;

    .line 844
    return-void
.end method

.method synthetic constructor <init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;[Ljava/lang/Class;Ljava/lang/Class;Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;)V
    .registers 5

    .prologue
    .line 840
    invoke-direct {p0, p1, p2, p3}, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;[Ljava/lang/Class;Ljava/lang/Class;)V

    return-void
.end method
