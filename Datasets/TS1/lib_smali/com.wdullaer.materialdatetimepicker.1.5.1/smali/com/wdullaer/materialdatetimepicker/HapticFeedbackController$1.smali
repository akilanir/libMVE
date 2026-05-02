.class Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController$1;
.super Landroid/database/ContentObserver;
.source "HapticFeedbackController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;


# direct methods
.method constructor <init>(Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;Landroid/os/Handler;)V
    .registers 3
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController$1;->this$0:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 4
    .param p1, "selfChange"    # Z

    .prologue
    .line 36
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController$1;->this$0:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController$1;->this$0:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    # getter for: Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->access$100(Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;)Landroid/content/Context;

    move-result-object v1

    # invokes: Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->checkGlobalSetting(Landroid/content/Context;)Z
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->access$200(Landroid/content/Context;)Z

    move-result v1

    # setter for: Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mIsGloballyEnabled:Z
    invoke-static {v0, v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->access$002(Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;Z)Z

    .line 37
    return-void
.end method
