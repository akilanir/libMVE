.class public Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
.super Landroid/app/DialogFragment;
.source "TimePickerDialog.java"

# interfaces
.implements Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;,
        Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;,
        Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;
    }
.end annotation


# static fields
.field public static final AM:I = 0x0

.field public static final AMPM_INDEX:I = 0x2

.field public static final ENABLE_PICKER_INDEX:I = 0x3

.field public static final HOUR_INDEX:I = 0x0

.field private static final KEY_ACCENT:Ljava/lang/String; = "accent"

.field private static final KEY_CURRENT_ITEM_SHOWING:Ljava/lang/String; = "current_item_showing"

.field private static final KEY_DARK_THEME:Ljava/lang/String; = "dark_theme"

.field private static final KEY_DISMISS:Ljava/lang/String; = "dismiss"

.field private static final KEY_HOUR_OF_DAY:Ljava/lang/String; = "hour_of_day"

.field private static final KEY_IN_KB_MODE:Ljava/lang/String; = "in_kb_mode"

.field private static final KEY_IS_24_HOUR_VIEW:Ljava/lang/String; = "is_24_hour_view"

.field private static final KEY_MINUTE:Ljava/lang/String; = "minute"

.field private static final KEY_TITLE:Ljava/lang/String; = "dialog_title"

.field private static final KEY_TYPED_TIMES:Ljava/lang/String; = "typed_times"

.field private static final KEY_VIBRATE:Ljava/lang/String; = "vibrate"

.field public static final MINUTE_INDEX:I = 0x1

.field public static final PM:I = 0x1

.field private static final PULSE_ANIMATOR_DELAY:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "TimePickerDialog"


# instance fields
.field private mAccentColor:I

.field private mAllowAutoAdvance:Z

.field private mAmKeyCode:I

.field private mAmPmHitspace:Landroid/view/View;

.field private mAmPmTextView:Landroid/widget/TextView;

.field private mAmText:Ljava/lang/String;

.field private mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

.field private mCancelButton:Landroid/widget/Button;

.field private mDeletedKeyFormat:Ljava/lang/String;

.field private mDismissOnPause:Z

.field private mDoublePlaceholderText:Ljava/lang/String;

.field private mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

.field private mHourPickerDescription:Ljava/lang/String;

.field private mHourSpaceView:Landroid/widget/TextView;

.field private mHourView:Landroid/widget/TextView;

.field private mInKbMode:Z

.field private mInitialHourOfDay:I

.field private mInitialMinute:I

.field private mIs24HourMode:Z

.field private mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

.field private mMinutePickerDescription:Ljava/lang/String;

.field private mMinuteSpaceView:Landroid/widget/TextView;

.field private mMinuteView:Landroid/widget/TextView;

.field private mOkButton:Landroid/widget/Button;

.field private mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mPlaceholderText:C

.field private mPmKeyCode:I

.field private mPmText:Ljava/lang/String;

.field private mSelectHours:Ljava/lang/String;

.field private mSelectMinutes:Ljava/lang/String;

.field private mSelectedColor:I

.field private mThemeDark:Z

.field private mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

.field private mTitle:Ljava/lang/String;

.field private mTypedTimes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mUnselectedColor:I

.field private mVibrate:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 140
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 107
    const/4 v0, -0x1

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    .line 142
    return-void
.end method

.method static synthetic access$100(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;IZZZ)V
    .registers 5
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    return-void
.end method

.method static synthetic access$200(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    return v0
.end method

.method static synthetic access$300(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    return-object v0
.end method

.method static synthetic access$700(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;I)V
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;I)Z
    .registers 3
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->processKeyUp(I)Z

    move-result v0

    return v0
.end method

.method private addKeyIfLegal(I)Z
    .registers 10
    .param p1, "keyCode"    # I

    .prologue
    const/4 v7, 0x7

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 672
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v3, :cond_10

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x4

    if-eq v3, v4, :cond_1a

    :cond_10
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v3, :cond_1b

    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 694
    :cond_1a
    :goto_1a
    return v1

    .line 677
    :cond_1b
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 678
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeLegalSoFar()Z

    move-result v3

    if-nez v3, :cond_2e

    .line 679
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->deleteLastTypedKey()I

    goto :goto_1a

    .line 683
    :cond_2e
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getValFromKeyCode(I)I

    move-result v0

    .line 684
    .local v0, "val":I
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    const-string v4, "%d"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 686
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v1

    if-eqz v1, :cond_7f

    .line 687
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v1, :cond_7a

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x3

    if-gt v1, v3, :cond_7a

    .line 688
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 689
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 691
    :cond_7a
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_7f
    move v1, v2

    .line 694
    goto :goto_1a
.end method

.method private deleteLastTypedKey()I
    .registers 4

    .prologue
    .line 730
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 731
    .local v0, "deleted":I
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v1

    if-nez v1, :cond_20

    .line 732
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 734
    :cond_20
    return v0
.end method

.method private finishKbMode(Z)V
    .registers 8
    .param p1, "updateDisplays"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 742
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 743
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 744
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getEnteredTime([Ljava/lang/Boolean;)[I

    move-result-object v0

    .line 745
    .local v0, "values":[I
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    aget v2, v0, v4

    aget v3, v0, v5

    invoke-virtual {v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setTime(II)V

    .line 746
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v1, :cond_26

    .line 747
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    const/4 v2, 0x2

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setAmOrPm(I)V

    .line 749
    :cond_26
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 751
    .end local v0    # "values":[I
    :cond_2b
    if-eqz p1, :cond_35

    .line 752
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    .line 753
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->trySettingInputEnabled(Z)Z

    .line 755
    :cond_35
    return-void
.end method

.method private generateLegalTimesTree()V
    .registers 23

    .prologue
    .line 907
    const/4 v5, 0x7

    .line 908
    .local v5, "k0":I
    const/16 v6, 0x8

    .line 909
    .local v6, "k1":I
    const/16 v7, 0x9

    .line 910
    .local v7, "k2":I
    const/16 v8, 0xa

    .line 911
    .local v8, "k3":I
    const/16 v9, 0xb

    .line 912
    .local v9, "k4":I
    const/16 v10, 0xc

    .line 913
    .local v10, "k5":I
    const/16 v11, 0xd

    .line 914
    .local v11, "k6":I
    const/16 v12, 0xe

    .line 915
    .local v12, "k7":I
    const/16 v13, 0xf

    .line 916
    .local v13, "k8":I
    const/16 v14, 0x10

    .line 919
    .local v14, "k9":I
    new-instance v19, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .line 920
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    move/from16 v19, v0

    if-eqz v19, :cond_1d9

    .line 922
    new-instance v15, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x6

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 923
    .local v15, "minuteFirstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    new-instance v16, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0xa

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    const/16 v20, 0x6

    aput v11, v19, v20

    const/16 v20, 0x7

    aput v12, v19, v20

    const/16 v20, 0x8

    aput v13, v19, v20

    const/16 v20, 0x9

    aput v14, v19, v20

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 925
    .local v16, "minuteSecondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v15 .. v16}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 928
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 929
    .local v3, "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 932
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x6

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 933
    .local v17, "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 935
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 938
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v11, v19, v20

    const/16 v20, 0x1

    aput v12, v19, v20

    const/16 v20, 0x2

    aput v13, v19, v20

    const/16 v20, 0x3

    aput v14, v19, v20

    invoke-direct/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 940
    .local v18, "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v17 .. v18}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 943
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v11, v19, v20

    const/16 v20, 0x1

    aput v12, v19, v20

    const/16 v20, 0x2

    aput v13, v19, v20

    const/16 v20, 0x3

    aput v14, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 944
    .restart local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 946
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 949
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v7, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 950
    .restart local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 953
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 954
    .restart local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 956
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 959
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v9, v19, v20

    const/16 v20, 0x1

    aput v10, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 960
    .restart local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 962
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 965
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x7

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v8, v19, v20

    const/16 v20, 0x1

    aput v9, v19, v20

    const/16 v20, 0x2

    aput v10, v19, v20

    const/16 v20, 0x3

    aput v11, v19, v20

    const/16 v20, 0x4

    aput v12, v19, v20

    const/16 v20, 0x5

    aput v13, v19, v20

    const/16 v20, 0x6

    aput v14, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 966
    .restart local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 968
    invoke-virtual {v3, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1031
    .end local v15    # "minuteFirstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .end local v16    # "minuteSecondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    :goto_1d8
    return-void

    .line 972
    .end local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .end local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .end local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    :cond_1d9
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v21

    aput v21, v19, v20

    const/16 v20, 0x1

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v21

    aput v21, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 975
    .local v2, "ampm":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v6, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 976
    .restart local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 978
    invoke-virtual {v3, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 981
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 982
    .restart local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 984
    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 987
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0x6

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    invoke-direct/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 988
    .restart local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v17 .. v18}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 990
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 994
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v19, 0xa

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    const/16 v20, 0x6

    aput v11, v19, v20

    const/16 v20, 0x7

    aput v12, v19, v20

    const/16 v20, 0x8

    aput v13, v19, v20

    const/16 v20, 0x9

    aput v14, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 995
    .local v4, "fourthDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 997
    invoke-virtual {v4, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1000
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v11, v19, v20

    const/16 v20, 0x1

    aput v12, v19, v20

    const/16 v20, 0x2

    aput v13, v19, v20

    const/16 v20, 0x3

    aput v14, v19, v20

    invoke-direct/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 1001
    .restart local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v17 .. v18}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1003
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1006
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v8, v19, v20

    const/16 v20, 0x1

    aput v9, v19, v20

    const/16 v20, 0x2

    aput v10, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 1007
    .restart local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1010
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0xa

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    const/16 v20, 0x6

    aput v11, v19, v20

    const/16 v20, 0x7

    aput v12, v19, v20

    const/16 v20, 0x8

    aput v13, v19, v20

    const/16 v20, 0x9

    aput v14, v19, v20

    invoke-direct/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 1011
    .restart local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v17 .. v18}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1013
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1016
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v7, v19, v20

    const/16 v20, 0x1

    aput v8, v19, v20

    const/16 v20, 0x2

    aput v9, v19, v20

    const/16 v20, 0x3

    aput v10, v19, v20

    const/16 v20, 0x4

    aput v11, v19, v20

    const/16 v20, 0x5

    aput v12, v19, v20

    const/16 v20, 0x6

    aput v13, v19, v20

    const/16 v20, 0x7

    aput v14, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 1017
    .restart local v3    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1019
    invoke-virtual {v3, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1022
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0x6

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 1023
    .restart local v17    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1026
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v19, 0xa

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput v5, v19, v20

    const/16 v20, 0x1

    aput v6, v19, v20

    const/16 v20, 0x2

    aput v7, v19, v20

    const/16 v20, 0x3

    aput v8, v19, v20

    const/16 v20, 0x4

    aput v9, v19, v20

    const/16 v20, 0x5

    aput v10, v19, v20

    const/16 v20, 0x6

    aput v11, v19, v20

    const/16 v20, 0x7

    aput v12, v19, v20

    const/16 v20, 0x8

    aput v13, v19, v20

    const/16 v20, 0x9

    aput v14, v19, v20

    invoke-direct/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>([I)V

    .line 1027
    .restart local v18    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v17 .. v18}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 1029
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    goto/16 :goto_1d8
.end method

.method private getAmOrPmKeyCode(I)I
    .registers 13
    .param p1, "amOrPm"    # I

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v5, -0x1

    .line 872
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    if-eq v6, v5, :cond_c

    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    if-ne v6, v5, :cond_61

    .line 874
    :cond_c
    invoke-static {v5}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object v3

    .line 877
    .local v3, "kcm":Landroid/view/KeyCharacterMap;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    if-ge v2, v6, :cond_61

    .line 878
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 879
    .local v0, "amChar":C
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 880
    .local v4, "pmChar":C
    if-eq v0, v4, :cond_6e

    .line 881
    new-array v6, v10, [C

    aput-char v0, v6, v8

    aput-char v4, v6, v9

    invoke-virtual {v3, v6}, Landroid/view/KeyCharacterMap;->getEvents([C)[Landroid/view/KeyEvent;

    move-result-object v1

    .line 883
    .local v1, "events":[Landroid/view/KeyEvent;
    if-eqz v1, :cond_66

    array-length v6, v1

    const/4 v7, 0x4

    if-ne v6, v7, :cond_66

    .line 884
    aget-object v6, v1, v8

    invoke-virtual {v6}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v6

    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    .line 885
    aget-object v6, v1, v10

    invoke-virtual {v6}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v6

    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    .line 893
    .end local v0    # "amChar":C
    .end local v1    # "events":[Landroid/view/KeyEvent;
    .end local v2    # "i":I
    .end local v3    # "kcm":Landroid/view/KeyCharacterMap;
    .end local v4    # "pmChar":C
    :cond_61
    :goto_61
    if-nez p1, :cond_71

    .line 894
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    .line 899
    :cond_65
    :goto_65
    return v5

    .line 887
    .restart local v0    # "amChar":C
    .restart local v1    # "events":[Landroid/view/KeyEvent;
    .restart local v2    # "i":I
    .restart local v3    # "kcm":Landroid/view/KeyCharacterMap;
    .restart local v4    # "pmChar":C
    :cond_66
    const-string v6, "TimePickerDialog"

    const-string v7, "Unable to find keycodes for AM and PM."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_61

    .line 877
    .end local v1    # "events":[Landroid/view/KeyEvent;
    :cond_6e
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 895
    .end local v0    # "amChar":C
    .end local v2    # "i":I
    .end local v3    # "kcm":Landroid/view/KeyCharacterMap;
    .end local v4    # "pmChar":C
    :cond_71
    if-ne p1, v9, :cond_65

    .line 896
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    goto :goto_65
.end method

.method private getEnteredTime([Ljava/lang/Boolean;)[I
    .registers 13
    .param p1, "enteredZeros"    # [Ljava/lang/Boolean;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 832
    const/4 v0, -0x1

    .line 833
    .local v0, "amOrPm":I
    const/4 v5, 0x1

    .line 834
    .local v5, "startIndex":I
    iget-boolean v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v7, :cond_2a

    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 835
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 836
    .local v3, "keyCode":I
    invoke-direct {p0, v10}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v7

    if-ne v3, v7, :cond_52

    .line 837
    const/4 v0, 0x0

    .line 841
    :cond_29
    :goto_29
    const/4 v5, 0x2

    .line 843
    .end local v3    # "keyCode":I
    :cond_2a
    const/4 v4, -0x1

    .line 844
    .local v4, "minute":I
    const/4 v1, -0x1

    .line 845
    .local v1, "hour":I
    move v2, v5

    .local v2, "i":I
    :goto_2d
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-gt v2, v7, :cond_84

    .line 846
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v8, v2

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getValFromKeyCode(I)I

    move-result v6

    .line 847
    .local v6, "val":I
    if-ne v2, v5, :cond_5a

    .line 848
    move v4, v6

    .line 845
    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 838
    .end local v1    # "hour":I
    .end local v2    # "i":I
    .end local v4    # "minute":I
    .end local v6    # "val":I
    .restart local v3    # "keyCode":I
    :cond_52
    invoke-direct {p0, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v7

    if-ne v3, v7, :cond_29

    .line 839
    const/4 v0, 0x1

    goto :goto_29

    .line 849
    .end local v3    # "keyCode":I
    .restart local v1    # "hour":I
    .restart local v2    # "i":I
    .restart local v4    # "minute":I
    .restart local v6    # "val":I
    :cond_5a
    add-int/lit8 v7, v5, 0x1

    if-ne v2, v7, :cond_6c

    .line 850
    mul-int/lit8 v7, v6, 0xa

    add-int/2addr v4, v7

    .line 851
    if-eqz p1, :cond_4f

    if-nez v6, :cond_4f

    .line 852
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, p1, v9

    goto :goto_4f

    .line 854
    :cond_6c
    add-int/lit8 v7, v5, 0x2

    if-ne v2, v7, :cond_72

    .line 855
    move v1, v6

    goto :goto_4f

    .line 856
    :cond_72
    add-int/lit8 v7, v5, 0x3

    if-ne v2, v7, :cond_4f

    .line 857
    mul-int/lit8 v7, v6, 0xa

    add-int/2addr v1, v7

    .line 858
    if-eqz p1, :cond_4f

    if-nez v6, :cond_4f

    .line 859
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, p1, v10

    goto :goto_4f

    .line 864
    .end local v6    # "val":I
    :cond_84
    const/4 v7, 0x3

    new-array v7, v7, [I

    aput v1, v7, v10

    aput v4, v7, v9

    const/4 v8, 0x2

    aput v0, v7, v8

    return-object v7
.end method

.method private static getValFromKeyCode(I)I
    .registers 2
    .param p0, "keyCode"    # I

    .prologue
    .line 797
    packed-switch p0, :pswitch_data_1c

    .line 819
    const/4 v0, -0x1

    :goto_4
    return v0

    .line 799
    :pswitch_5
    const/4 v0, 0x0

    goto :goto_4

    .line 801
    :pswitch_7
    const/4 v0, 0x1

    goto :goto_4

    .line 803
    :pswitch_9
    const/4 v0, 0x2

    goto :goto_4

    .line 805
    :pswitch_b
    const/4 v0, 0x3

    goto :goto_4

    .line 807
    :pswitch_d
    const/4 v0, 0x4

    goto :goto_4

    .line 809
    :pswitch_f
    const/4 v0, 0x5

    goto :goto_4

    .line 811
    :pswitch_11
    const/4 v0, 0x6

    goto :goto_4

    .line 813
    :pswitch_13
    const/4 v0, 0x7

    goto :goto_4

    .line 815
    :pswitch_15
    const/16 v0, 0x8

    goto :goto_4

    .line 817
    :pswitch_18
    const/16 v0, 0x9

    goto :goto_4

    .line 797
    nop

    :pswitch_data_1c
    .packed-switch 0x7
        :pswitch_5
        :pswitch_7
        :pswitch_9
        :pswitch_b
        :pswitch_d
        :pswitch_f
        :pswitch_11
        :pswitch_13
        :pswitch_15
        :pswitch_18
    .end packed-switch
.end method

.method private isTypedTimeFullyLegal()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 716
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v3, :cond_1c

    .line 719
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getEnteredTime([Ljava/lang/Boolean;)[I

    move-result-object v0

    .line 720
    .local v0, "values":[I
    aget v3, v0, v2

    if-ltz v3, :cond_1a

    aget v3, v0, v1

    if-ltz v3, :cond_1a

    aget v3, v0, v1

    const/16 v4, 0x3c

    if-ge v3, v4, :cond_1a

    .line 724
    .end local v0    # "values":[I
    :goto_19
    return v1

    .restart local v0    # "values":[I
    :cond_1a
    move v1, v2

    .line 720
    goto :goto_19

    .line 724
    .end local v0    # "values":[I
    :cond_1c
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    :cond_3c
    move v2, v1

    :cond_3d
    move v1, v2

    goto :goto_19
.end method

.method private isTypedTimeLegalSoFar()Z
    .registers 5

    .prologue
    .line 702
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .line 703
    .local v2, "node":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 704
    .local v1, "keyCode":I
    invoke-virtual {v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->canReach(I)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-result-object v2

    .line 705
    if-nez v2, :cond_8

    .line 706
    const/4 v3, 0x0

    .line 709
    .end local v1    # "keyCode":I
    :goto_1f
    return v3

    :cond_20
    const/4 v3, 0x1

    goto :goto_1f
.end method

.method public static newInstance(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;IIZ)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .registers 5
    .param p0, "callback"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;
    .param p1, "hourOfDay"    # I
    .param p2, "minute"    # I
    .param p3, "is24HourMode"    # Z

    .prologue
    .line 153
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;-><init>()V

    .line 154
    .local v0, "ret":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->initialize(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 155
    return-object v0
.end method

.method private processKeyUp(I)Z
    .registers 9
    .param p1, "keyCode"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 587
    const/16 v4, 0x6f

    if-eq p1, v4, :cond_9

    const/4 v4, 0x4

    if-ne p1, v4, :cond_13

    .line 588
    :cond_9
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isCancelable()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->dismiss()V

    .line 650
    :cond_12
    :goto_12
    return v2

    .line 590
    :cond_13
    const/16 v4, 0x3d

    if-ne p1, v4, :cond_25

    .line 591
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v4, :cond_7f

    .line 592
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 593
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    goto :goto_12

    .line 597
    :cond_25
    const/16 v4, 0x42

    if-ne p1, v4, :cond_51

    .line 598
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v4, :cond_36

    .line 599
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 602
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    .line 604
    :cond_36
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    if-eqz v3, :cond_4d

    .line 605
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v5

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v6

    invoke-interface {v3, v4, v5, v6}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;->onTimeSet(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;II)V

    .line 608
    :cond_4d
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->dismiss()V

    goto :goto_12

    .line 610
    :cond_51
    const/16 v4, 0x43

    if-ne p1, v4, :cond_9d

    .line 611
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v4, :cond_7f

    .line 612
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7f

    .line 613
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->deleteLastTypedKey()I

    move-result v0

    .line 615
    .local v0, "deleted":I
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    if-ne v0, v4, :cond_81

    .line 616
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    .line 622
    .local v1, "deletedKeyStr":Ljava/lang/String;
    :goto_6d
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDeletedKeyFormat:Ljava/lang/String;

    new-array v6, v2, [Ljava/lang/Object;

    aput-object v1, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 624
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    .end local v0    # "deleted":I
    .end local v1    # "deletedKeyStr":Ljava/lang/String;
    :cond_7f
    move v2, v3

    .line 650
    goto :goto_12

    .line 617
    .restart local v0    # "deleted":I
    :cond_81
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    if-ne v0, v4, :cond_8a

    .line 618
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    .restart local v1    # "deletedKeyStr":Ljava/lang/String;
    goto :goto_6d

    .line 620
    .end local v1    # "deletedKeyStr":Ljava/lang/String;
    :cond_8a
    const-string v4, "%d"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getValFromKeyCode(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "deletedKeyStr":Ljava/lang/String;
    goto :goto_6d

    .line 627
    .end local v0    # "deleted":I
    .end local v1    # "deletedKeyStr":Ljava/lang/String;
    :cond_9d
    const/4 v4, 0x7

    if-eq p1, v4, :cond_d4

    const/16 v4, 0x8

    if-eq p1, v4, :cond_d4

    const/16 v4, 0x9

    if-eq p1, v4, :cond_d4

    const/16 v4, 0xa

    if-eq p1, v4, :cond_d4

    const/16 v4, 0xb

    if-eq p1, v4, :cond_d4

    const/16 v4, 0xc

    if-eq p1, v4, :cond_d4

    const/16 v4, 0xd

    if-eq p1, v4, :cond_d4

    const/16 v4, 0xe

    if-eq p1, v4, :cond_d4

    const/16 v4, 0xf

    if-eq p1, v4, :cond_d4

    const/16 v4, 0x10

    if-eq p1, v4, :cond_d4

    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v4, :cond_7f

    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    if-eq p1, v4, :cond_d4

    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    if-ne p1, v4, :cond_7f

    .line 634
    :cond_d4
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-nez v4, :cond_ef

    .line 635
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    if-nez v3, :cond_e5

    .line 637
    const-string v3, "TimePickerDialog"

    const-string v4, "Unable to initiate keyboard mode, TimePicker was null."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_12

    .line 640
    :cond_e5
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 641
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryStartingKbMode(I)V

    goto/16 :goto_12

    .line 645
    :cond_ef
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->addKeyIfLegal(I)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 646
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    goto/16 :goto_12
.end method

.method private setCurrentItemShowing(IZZZ)V
    .registers 14
    .param p1, "index"    # I
    .param p2, "animateCircle"    # Z
    .param p3, "delayLabelAnimate"    # Z
    .param p4, "announce"    # Z

    .prologue
    .line 547
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setCurrentItemShowing(IZ)V

    .line 550
    if-nez p1, :cond_64

    .line 551
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v1

    .line 552
    .local v1, "hours":I
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v6, :cond_13

    .line 553
    rem-int/lit8 v1, v1, 0xc

    .line 555
    :cond_13
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourPickerDescription:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 556
    if-eqz p4, :cond_3a

    .line 557
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectHours:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 559
    :cond_3a
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    .line 569
    .end local v1    # "hours":I
    .local v2, "labelToAnimate":Landroid/widget/TextView;
    :goto_3c
    if-nez p1, :cond_94

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectedColor:I

    .line 570
    .local v0, "hourColor":I
    :goto_40
    const/4 v6, 0x1

    if-ne p1, v6, :cond_97

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectedColor:I

    .line 571
    .local v3, "minuteColor":I
    :goto_45
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 572
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 574
    const v6, 0x3f59999a    # 0.85f

    const v7, 0x3f8ccccd    # 1.1f

    invoke-static {v2, v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 575
    .local v5, "pulseAnimator":Landroid/animation/ObjectAnimator;
    if-eqz p3, :cond_60

    .line 576
    const-wide/16 v6, 0x12c

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 578
    :cond_60
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 579
    return-void

    .line 561
    .end local v0    # "hourColor":I
    .end local v2    # "labelToAnimate":Landroid/widget/TextView;
    .end local v3    # "minuteColor":I
    .end local v5    # "pulseAnimator":Landroid/animation/ObjectAnimator;
    :cond_64
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v4

    .line 562
    .local v4, "minutes":I
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinutePickerDescription:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 563
    if-eqz p4, :cond_91

    .line 564
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectMinutes:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 566
    :cond_91
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    .restart local v2    # "labelToAnimate":Landroid/widget/TextView;
    goto :goto_3c

    .line 569
    .end local v4    # "minutes":I
    :cond_94
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    goto :goto_40

    .line 570
    .restart local v0    # "hourColor":I
    :cond_97
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    goto :goto_45
.end method

.method private setHour(IZ)V
    .registers 8
    .param p1, "value"    # I
    .param p2, "announce"    # Z

    .prologue
    .line 516
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v2, :cond_26

    .line 517
    const-string v0, "%02d"

    .line 526
    .local v0, "format":Ljava/lang/String;
    :cond_6
    :goto_6
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 527
    .local v1, "text":Ljava/lang/CharSequence;
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 528
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourSpaceView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 529
    if-eqz p2, :cond_25

    .line 530
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-static {v2, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 532
    :cond_25
    return-void

    .line 519
    .end local v0    # "format":Ljava/lang/String;
    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_26
    const-string v0, "%d"

    .line 520
    .restart local v0    # "format":Ljava/lang/String;
    rem-int/lit8 p1, p1, 0xc

    .line 521
    if-nez p1, :cond_6

    .line 522
    const/16 p1, 0xc

    goto :goto_6
.end method

.method private setMinute(I)V
    .registers 8
    .param p1, "value"    # I

    .prologue
    .line 535
    const/16 v1, 0x3c

    if-ne p1, v1, :cond_5

    .line 536
    const/4 p1, 0x0

    .line 538
    :cond_5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v2, "%02d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 539
    .local v0, "text":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-static {v1, v0}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 540
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 541
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteSpaceView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 542
    return-void
.end method

.method private tryStartingKbMode(I)V
    .registers 4
    .param p1, "keyCode"    # I

    .prologue
    const/4 v1, 0x0

    .line 661
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->trySettingInputEnabled(Z)Z

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v0, -0x1

    if-eq p1, v0, :cond_12

    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->addKeyIfLegal(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 663
    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 664
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 665
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    .line 667
    :cond_1d
    return-void
.end method

.method private updateAmPmDisplay(I)V
    .registers 4
    .param p1, "amOrPm"    # I

    .prologue
    .line 454
    if-nez p1, :cond_18

    .line 455
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 456
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 457
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 465
    :goto_17
    return-void

    .line 458
    :cond_18
    const/4 v0, 0x1

    if-ne p1, v0, :cond_31

    .line 459
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 460
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 461
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_17

    .line 463
    :cond_31
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_17
.end method

.method private updateDisplay(Z)V
    .registers 14
    .param p1, "allowEmptyDisplay"    # Z

    .prologue
    .line 765
    if-nez p1, :cond_3e

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3e

    .line 766
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v1

    .line 767
    .local v1, "hour":I
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v4

    .line 768
    .local v4, "minute":I
    const/4 v8, 0x1

    invoke-direct {p0, v1, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setHour(IZ)V

    .line 769
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setMinute(I)V

    .line 770
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v8, :cond_29

    .line 771
    const/16 v8, 0xc

    if-ge v1, v8, :cond_3c

    const/4 v8, 0x0

    :goto_26
    invoke-direct {p0, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    .line 773
    :cond_29
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v8

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-direct {p0, v8, v9, v10, v11}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    .line 774
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setEnabled(Z)V

    .line 794
    .end local v1    # "hour":I
    .end local v4    # "minute":I
    :cond_3b
    :goto_3b
    return-void

    .line 771
    .restart local v1    # "hour":I
    .restart local v4    # "minute":I
    :cond_3c
    const/4 v8, 0x1

    goto :goto_26

    .line 776
    .end local v1    # "hour":I
    .end local v4    # "minute":I
    :cond_3e
    const/4 v8, 0x2

    new-array v0, v8, [Ljava/lang/Boolean;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v0, v8

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v0, v8

    .line 777
    .local v0, "enteredZeros":[Ljava/lang/Boolean;
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getEnteredTime([Ljava/lang/Boolean;)[I

    move-result-object v7

    .line 778
    .local v7, "values":[I
    const/4 v8, 0x0

    aget-object v8, v0, v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_a8

    const-string v2, "%02d"

    .line 779
    .local v2, "hourFormat":Ljava/lang/String;
    :goto_60
    const/4 v8, 0x1

    aget-object v8, v0, v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_ab

    const-string v5, "%02d"

    .line 780
    .local v5, "minuteFormat":Ljava/lang/String;
    :goto_6b
    const/4 v8, 0x0

    aget v8, v7, v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_ae

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    .line 782
    .local v3, "hourStr":Ljava/lang/String;
    :goto_73
    const/4 v8, 0x1

    aget v8, v7, v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_c8

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    .line 784
    .local v6, "minuteStr":Ljava/lang/String;
    :goto_7b
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 785
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourSpaceView:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 786
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 787
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 788
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteSpaceView:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 789
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 790
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v8, :cond_3b

    .line 791
    const/4 v8, 0x2

    aget v8, v7, v8

    invoke-direct {p0, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    goto :goto_3b

    .line 778
    .end local v2    # "hourFormat":Ljava/lang/String;
    .end local v3    # "hourStr":Ljava/lang/String;
    .end local v5    # "minuteFormat":Ljava/lang/String;
    .end local v6    # "minuteStr":Ljava/lang/String;
    :cond_a8
    const-string v2, "%2d"

    goto :goto_60

    .line 779
    .restart local v2    # "hourFormat":Ljava/lang/String;
    :cond_ab
    const-string v5, "%2d"

    goto :goto_6b

    .line 780
    .restart local v5    # "minuteFormat":Ljava/lang/String;
    :cond_ae
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x0

    aget v10, v7, v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v2, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x20

    iget-char v10, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPlaceholderText:C

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    goto :goto_73

    .line 782
    .restart local v3    # "hourStr":Ljava/lang/String;
    :cond_c8
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x1

    aget v10, v7, v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x20

    iget-char v10, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPlaceholderText:C

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    goto :goto_7b
.end method


# virtual methods
.method public dismissOnPause(Z)V
    .registers 2
    .param p1, "dismissOnPause"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDismissOnPause:Z

    .line 213
    return-void
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public initialize(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;IIZ)V
    .registers 7
    .param p1, "callback"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;
    .param p2, "hourOfDay"    # I
    .param p3, "minute"    # I
    .param p4, "is24HourMode"    # Z

    .prologue
    const/4 v1, 0x0

    .line 160
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    .line 162
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    .line 163
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    .line 164
    iput-boolean p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    .line 165
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 166
    const-string v0, ""

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    .line 167
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    .line 168
    const/4 v0, -0x1

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    .line 169
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mVibrate:Z

    .line 170
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDismissOnPause:Z

    .line 171
    return-void
.end method

.method public isThemeDark()Z
    .registers 2

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    return v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 439
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 440
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 441
    :cond_c
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 235
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 236
    if-eqz p1, :cond_5d

    const-string v0, "hour_of_day"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5d

    const-string v0, "minute"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5d

    const-string v0, "is_24_hour_view"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 239
    const-string v0, "hour_of_day"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    .line 240
    const-string v0, "minute"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    .line 241
    const-string v0, "is_24_hour_view"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    .line 242
    const-string v0, "in_kb_mode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 243
    const-string v0, "dialog_title"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    .line 244
    const-string v0, "dark_theme"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    .line 245
    const-string v0, "accent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    .line 246
    const-string v0, "vibrate"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mVibrate:Z

    .line 248
    :cond_5d
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 24
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 253
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/Window;->requestFeature(I)Z

    .line 255
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$layout;->mdtp_time_picker_dialog:I

    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v19

    .line 256
    .local v19, "view":Landroid/view/View;
    new-instance v13, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;

    const/4 v1, 0x0

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$1;)V

    .line 257
    .local v13, "keyboardListener":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->time_picker_dialog:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v13}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 259
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    .line 260
    .local v16, "res":Landroid/content/res/Resources;
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_hour_picker_description:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourPickerDescription:Ljava/lang/String;

    .line 261
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_hours:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectHours:Ljava/lang/String;

    .line 262
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_minute_picker_description:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinutePickerDescription:Ljava/lang/String;

    .line 263
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_minutes:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectMinutes:Ljava/lang/String;

    .line 264
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectedColor:I

    .line 265
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color_focused:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    .line 267
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->hours:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    .line 268
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 269
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->hour_space:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourSpaceView:Landroid/widget/TextView;

    .line 270
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->minutes_space:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteSpaceView:Landroid/widget/TextView;

    .line 271
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->minutes:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    .line 272
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 273
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->ampm_label:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    .line 274
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 275
    new-instance v1, Ljava/text/DateFormatSymbols;

    invoke-direct {v1}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v1}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v8

    .line 276
    .local v8, "amPmTexts":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v8, v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    .line 277
    const/4 v1, 0x1

    aget-object v1, v8, v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    .line 279
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    .line 281
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->time_picker:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 282
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnValueSelectedListener(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;)V

    .line 283
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1, v13}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 284
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    move-object/from16 v3, p0

    invoke-virtual/range {v1 .. v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->initialize(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;IIZ)V

    .line 287
    const/4 v11, 0x0

    .line 288
    .local v11, "currentItemShowing":I
    if-eqz p3, :cond_13f

    const-string v1, "current_item_showing"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13f

    .line 290
    const-string v1, "current_item_showing"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    .line 292
    :cond_13f
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    .line 293
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->invalidate()V

    .line 295
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$1;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 302
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->ok:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    .line 311
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$3;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$3;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 326
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual {v1, v13}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Roboto-Medium"

    invoke-static {v2, v3}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 329
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->cancel:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCancelButton:Landroid/widget/Button;

    .line 330
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCancelButton:Landroid/widget/Button;

    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 337
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCancelButton:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Roboto-Medium"

    invoke-static {v2, v3}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 338
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCancelButton:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isCancelable()Z

    move-result v1

    if-eqz v1, :cond_359

    const/4 v1, 0x0

    :goto_1de
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 341
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->ampm_hitspace:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    .line 342
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v1, :cond_35d

    .line 343
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 345
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x2

    invoke-direct {v15, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 347
    .local v15, "paramsSeparator":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v15, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 348
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->separator:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/TextView;

    .line 349
    .local v17, "separatorView":Landroid/widget/TextView;
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 369
    .end local v15    # "paramsSeparator":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v17    # "separatorView":Landroid/widget/TextView;
    :goto_217
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAllowAutoAdvance:Z

    .line 370
    move-object/from16 v0, p0

    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setHour(IZ)V

    .line 371
    move-object/from16 v0, p0

    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setMinute(I)V

    .line 374
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_time_placeholder:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    .line 375
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_deleted_key:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDeletedKeyFormat:Ljava/lang/String;

    .line 376
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move-object/from16 v0, p0

    iput-char v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPlaceholderText:C

    .line 377
    const/4 v1, -0x1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    move-object/from16 v0, p0

    iput v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    .line 378
    invoke-direct/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->generateLegalTimesTree()V

    .line 379
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v1, :cond_385

    .line 380
    const-string v1, "typed_times"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    .line 381
    const/4 v1, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryStartingKbMode(I)V

    .line 382
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    .line 388
    :cond_27f
    :goto_27f
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->time_picker_header:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/TextView;

    .line 389
    .local v18, "timePickerHeader":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2a2

    .line 390
    const/4 v1, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 391
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 395
    :cond_2a2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    invoke-virtual {v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setTheme(Landroid/content/Context;Z)V

    .line 398
    move-object/from16 v0, p0

    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2cb

    .line 399
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->getAccentColorFromThemeIfAvailable(Landroid/content/Context;)I

    move-result v7

    .line 400
    .local v7, "accentColor":I
    const/4 v1, -0x1

    if-eq v7, v1, :cond_2cb

    .line 401
    move-object/from16 v0, p0

    iput v7, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    .line 404
    .end local v7    # "accentColor":I
    :cond_2cb
    move-object/from16 v0, p0

    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_31a

    .line 405
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 406
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCancelButton:Landroid/widget/Button;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 407
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setAccentColor(I)V

    .line 408
    move-object/from16 v0, p0

    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 409
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->time_display_background:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 410
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->time_display:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 413
    :cond_31a
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_circle_background:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    .line 414
    .local v10, "circleBackground":I
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_background_color:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    .line 415
    .local v9, "backgroundColor":I
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_light_gray:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    .line 417
    .local v12, "darkBackgroundColor":I
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_light_gray:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v14

    .line 419
    .local v14, "lightGray":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    if-eqz v2, :cond_396

    .end local v14    # "lightGray":I
    :goto_344
    invoke-virtual {v1, v14}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setBackgroundColor(I)V

    .line 420
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$id;->time_picker_dialog:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    if-eqz v2, :cond_398

    .end local v12    # "darkBackgroundColor":I
    :goto_355
    invoke-virtual {v1, v12}, Landroid/view/View;->setBackgroundColor(I)V

    .line 421
    return-object v19

    .line 338
    .end local v9    # "backgroundColor":I
    .end local v10    # "circleBackground":I
    .end local v18    # "timePickerHeader":Landroid/widget/TextView;
    :cond_359
    const/16 v1, 0x8

    goto/16 :goto_1de

    .line 351
    :cond_35d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 352
    move-object/from16 v0, p0

    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    const/16 v2, 0xc

    if-ge v1, v2, :cond_383

    const/4 v1, 0x0

    :goto_36e
    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    .line 353
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_217

    .line 352
    :cond_383
    const/4 v1, 0x1

    goto :goto_36e

    .line 383
    :cond_385
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    if-nez v1, :cond_27f

    .line 384
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    goto/16 :goto_27f

    .restart local v9    # "backgroundColor":I
    .restart local v10    # "circleBackground":I
    .restart local v12    # "darkBackgroundColor":I
    .restart local v14    # "lightGray":I
    .restart local v18    # "timePickerHeader":Landroid/widget/TextView;
    :cond_396
    move v14, v10

    .line 419
    goto :goto_344

    .end local v14    # "lightGray":I
    :cond_398
    move v12, v9

    .line 420
    goto :goto_355
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 445
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 446
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 447
    :cond_c
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 432
    invoke-super {p0}, Landroid/app/DialogFragment;->onPause()V

    .line 433
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->stop()V

    .line 434
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDismissOnPause:Z

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->dismiss()V

    .line 435
    :cond_f
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 426
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 427
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->start()V

    .line 428
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 469
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    if-eqz v0, :cond_5a

    .line 470
    const-string v0, "hour_of_day"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 471
    const-string v0, "minute"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 472
    const-string v0, "is_24_hour_view"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 473
    const-string v0, "current_item_showing"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 474
    const-string v0, "in_kb_mode"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 475
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v0, :cond_3e

    .line 476
    const-string v0, "typed_times"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 478
    :cond_3e
    const-string v0, "dialog_title"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    const-string v0, "dark_theme"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 480
    const-string v0, "accent"

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 481
    const-string v0, "vibrate"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mVibrate:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 483
    :cond_5a
    return-void
.end method

.method public onValueSelected(IIZ)V
    .registers 10
    .param p1, "pickerIndex"    # I
    .param p2, "newValue"    # I
    .param p3, "autoAdvance"    # Z

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 490
    if-nez p1, :cond_5c

    .line 491
    invoke-direct {p0, p2, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setHour(IZ)V

    .line 492
    const-string v1, "%d"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 493
    .local v0, "announcement":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAllowAutoAdvance:Z

    if-eqz v1, :cond_3d

    if-eqz p3, :cond_3d

    .line 494
    invoke-direct {p0, v4, v4, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    .line 495
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectMinutes:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 500
    :goto_37
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-static {v1, v0}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 512
    .end local v0    # "announcement":Ljava/lang/String;
    :cond_3c
    :goto_3c
    return-void

    .line 497
    .restart local v0    # "announcement":Ljava/lang/String;
    :cond_3d
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourPickerDescription:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_37

    .line 501
    .end local v0    # "announcement":Ljava/lang/String;
    :cond_5c
    if-ne p1, v4, :cond_80

    .line 502
    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setMinute(I)V

    .line 503
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinutePickerDescription:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_3c

    .line 504
    :cond_80
    const/4 v1, 0x2

    if-ne p1, v1, :cond_87

    .line 505
    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    goto :goto_3c

    .line 506
    :cond_87
    const/4 v1, 0x3

    if-ne p1, v1, :cond_3c

    .line 507
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v1

    if-nez v1, :cond_95

    .line 508
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 510
    :cond_95
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    goto :goto_3c
.end method

.method public setAccentColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 192
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAccentColor:I

    .line 193
    return-void
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .registers 2
    .param p1, "onCancelListener"    # Landroid/content/DialogInterface$OnCancelListener;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 221
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2
    .param p1, "onDismissListener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 224
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 225
    return-void
.end method

.method public setOnTimeSetListener(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;)V
    .registers 2
    .param p1, "callback"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    .line 217
    return-void
.end method

.method public setStartTime(II)V
    .registers 4
    .param p1, "hourOfDay"    # I
    .param p2, "minute"    # I

    .prologue
    .line 228
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    .line 229
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    .line 230
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 231
    return-void
.end method

.method public setThemeDark(Z)V
    .registers 2
    .param p1, "dark"    # Z

    .prologue
    .line 188
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    .line 189
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTitle:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public tryVibrate()V
    .registers 2

    .prologue
    .line 450
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mVibrate:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 451
    :cond_9
    return-void
.end method

.method public vibrate(Z)V
    .registers 2
    .param p1, "vibrate"    # Z

    .prologue
    .line 204
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mVibrate:Z

    .line 205
    return-void
.end method
