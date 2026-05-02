.class Lde/robv/android/xposed/XC_MethodReplacement$2;
.super Lde/robv/android/xposed/XC_MethodReplacement;
.source "XC_MethodReplacement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/robv/android/xposed/XC_MethodReplacement;->returnConstant(ILjava/lang/Object;)Lde/robv/android/xposed/XC_MethodReplacement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$result:Ljava/lang/Object;


# direct methods
.method constructor <init>(ILjava/lang/Object;)V
    .registers 3
    .param p1, "$anonymous0"    # I

    .prologue
    .line 1
    iput-object p2, p0, Lde/robv/android/xposed/XC_MethodReplacement$2;->val$result:Ljava/lang/Object;

    .line 48
    invoke-direct {p0, p1}, Lde/robv/android/xposed/XC_MethodReplacement;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected replaceHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)Ljava/lang/Object;
    .registers 3
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodReplacement$2;->val$result:Ljava/lang/Object;

    return-object v0
.end method
