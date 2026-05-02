.class public abstract Lde/robv/android/xposed/XC_MethodReplacement;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "XC_MethodReplacement.java"


# static fields
.field public static final DO_NOTHING:Lde/robv/android/xposed/XC_MethodReplacement;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 30
    new-instance v0, Lde/robv/android/xposed/XC_MethodReplacement$1;

    const/16 v1, 0x4e20

    invoke-direct {v0, v1}, Lde/robv/android/xposed/XC_MethodReplacement$1;-><init>(I)V

    sput-object v0, Lde/robv/android/xposed/XC_MethodReplacement;->DO_NOTHING:Lde/robv/android/xposed/XC_MethodReplacement;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    .line 7
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "priority"    # I

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lde/robv/android/xposed/XC_MethodHook;-><init>(I)V

    .line 10
    return-void
.end method

.method public static returnConstant(ILjava/lang/Object;)Lde/robv/android/xposed/XC_MethodReplacement;
    .registers 3
    .param p0, "priority"    # I
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 48
    new-instance v0, Lde/robv/android/xposed/XC_MethodReplacement$2;

    invoke-direct {v0, p0, p1}, Lde/robv/android/xposed/XC_MethodReplacement$2;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method

.method public static returnConstant(Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodReplacement;
    .registers 2
    .param p0, "result"    # Ljava/lang/Object;

    .prologue
    .line 41
    const/16 v0, 0x32

    invoke-static {v0, p0}, Lde/robv/android/xposed/XC_MethodReplacement;->returnConstant(ILjava/lang/Object;)Lde/robv/android/xposed/XC_MethodReplacement;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected final afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 2
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 22
    return-void
.end method

.method protected final beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 15
    :try_start_0
    invoke-virtual {p0, p1}, Lde/robv/android/xposed/XC_MethodReplacement;->replaceHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)Ljava/lang/Object;

    move-result-object v0

    .line 16
    .local v0, "result":Ljava/lang/Object;
    invoke-virtual {p1, v0}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_8

    .line 20
    .end local v0    # "result":Ljava/lang/Object;
    :goto_7
    return-void

    .line 17
    :catch_8
    move-exception v1

    .line 18
    .local v1, "t":Ljava/lang/Throwable;
    invoke-virtual {p1, v1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setThrowable(Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method protected abstract replaceHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
