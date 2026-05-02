.class public Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
.super Lde/robv/android/xposed/callbacks/XCallback$Param;
.source "XC_MethodHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/XC_MethodHook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MethodHookParam"
.end annotation


# instance fields
.field public args:[Ljava/lang/Object;

.field public method:Ljava/lang/reflect/Member;

.field private result:Ljava/lang/Object;

.field returnEarly:Z

.field public thisObject:Ljava/lang/Object;

.field private throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0}, Lde/robv/android/xposed/callbacks/XCallback$Param;-><init>()V

    .line 39
    iput-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    .line 40
    iput-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->returnEarly:Z

    .line 31
    return-void
.end method


# virtual methods
.method public getResult()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    return-object v0
.end method

.method public getResultOrThrowable()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    if-eqz v0, :cond_7

    .line 83
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    throw v0

    .line 84
    :cond_7
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    return-object v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public hasThrowable()Z
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setResult(Ljava/lang/Object;)V
    .registers 3
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 54
    iput-object p1, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->returnEarly:Z

    .line 57
    return-void
.end method

.method public setThrowable(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 75
    iput-object p1, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->throwable:Ljava/lang/Throwable;

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->returnEarly:Z

    .line 78
    return-void
.end method
