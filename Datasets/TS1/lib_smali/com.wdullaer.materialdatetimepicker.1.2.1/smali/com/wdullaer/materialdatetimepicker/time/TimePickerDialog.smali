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

.field private static final KEY_CURRENT_ITEM_SHOWING:Ljava/lang/String; = "current_item_showing"

.field private static final KEY_DARK_THEME:Ljava/lang/String; = "dark_theme"

.field private static final KEY_HOUR_OF_DAY:Ljava/lang/String; = "hour_of_day"

.field private static final KEY_IN_KB_MODE:Ljava/lang/String; = "in_kb_mode"

.field private static final KEY_IS_24_HOUR_VIEW:Ljava/lang/String; = "is_24_hour_view"

.field private static final KEY_MINUTE:Ljava/lang/String; = "minute"

.field private static final KEY_TYPED_TIMES:Ljava/lang/String; = "typed_times"

.field public static final MINUTE_INDEX:I = 0x1

.field public static final PM:I = 0x1

.field private static final PULSE_ANIMATOR_DELAY:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "TimePickerDialog"


# instance fields
.field private mAllowAutoAdvance:Z

.field private mAmKeyCode:I

.field private mAmPmHitspace:Landroid/view/View;

.field private mAmPmTextView:Landroid/widget/TextView;

.field private mAmText:Ljava/lang/String;

.field private mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

.field private mDeletedKeyFormat:Ljava/lang/String;

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

.field private mPlaceholderText:C

.field private mPmKeyCode:I

.field private mPmText:Ljava/lang/String;

.field private mSelectHours:Ljava/lang/String;

.field private mSelectMinutes:Ljava/lang/String;

.field private mSelectedColor:I

.field private mThemeDark:Z

.field private mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

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


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 130
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 132
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
    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    return-void
.end method

.method static synthetic access$200(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    return v0
.end method

.method static synthetic access$300(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    return-object v0
.end method

.method static synthetic access$700(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;I)V
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;I)Z
    .registers 3
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    .param p1, "x1"    # I

    .prologue
    .line 53
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

    .line 592
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

    .line 614
    :cond_1a
    :goto_1a
    return v1

    .line 597
    :cond_1b
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 598
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeLegalSoFar()Z

    move-result v3

    if-nez v3, :cond_2e

    .line 599
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->deleteLastTypedKey()I

    goto :goto_1a

    .line 603
    :cond_2e
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getValFromKeyCode(I)I

    move-result v0

    .line 604
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

    .line 606
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v1

    if-eqz v1, :cond_7f

    .line 607
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v1, :cond_7a

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x3

    if-gt v1, v3, :cond_7a

    .line 608
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 609
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 611
    :cond_7a
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_7f
    move v1, v2

    .line 614
    goto :goto_1a
.end method

.method private deleteLastTypedKey()I
    .registers 4

    .prologue
    .line 650
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

    .line 651
    .local v0, "deleted":I
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v1

    if-nez v1, :cond_20

    .line 652
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 654
    :cond_20
    return v0
.end method

.method private finishKbMode(Z)V
    .registers 8
    .param p1, "updateDisplays"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 662
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 663
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 664
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getEnteredTime([Ljava/lang/Boolean;)[I

    move-result-object v0

    .line 665
    .local v0, "values":[I
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    aget v2, v0, v4

    aget v3, v0, v5

    invoke-virtual {v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setTime(II)V

    .line 666
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v1, :cond_26

    .line 667
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    const/4 v2, 0x2

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setAmOrPm(I)V

    .line 669
    :cond_26
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 671
    .end local v0    # "values":[I
    :cond_2b
    if-eqz p1, :cond_35

    .line 672
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    .line 673
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->trySettingInputEnabled(Z)Z

    .line 675
    :cond_35
    return-void
.end method

.method private generateLegalTimesTree()V
    .registers 24

    .prologue
    .line 827
    const/4 v6, 0x7

    .line 828
    .local v6, "k0":I
    const/16 v7, 0x8

    .line 829
    .local v7, "k1":I
    const/16 v8, 0x9

    .line 830
    .local v8, "k2":I
    const/16 v9, 0xa

    .line 831
    .local v9, "k3":I
    const/16 v10, 0xb

    .line 832
    .local v10, "k4":I
    const/16 v11, 0xc

    .line 833
    .local v11, "k5":I
    const/16 v12, 0xd

    .line 834
    .local v12, "k6":I
    const/16 v13, 0xe

    .line 835
    .local v13, "k7":I
    const/16 v14, 0xf

    .line 836
    .local v14, "k8":I
    const/16 v15, 0x10

    .line 839
    .local v15, "k9":I
    new-instance v20, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [I

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .line 840
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    move/from16 v20, v0

    if-eqz v20, :cond_201

    .line 842
    new-instance v16, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x6

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 843
    .local v16, "minuteFirstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    new-instance v17, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0xa

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    const/16 v21, 0x6

    aput v12, v20, v21

    const/16 v21, 0x7

    aput v13, v20, v21

    const/16 v21, 0x8

    aput v14, v20, v21

    const/16 v21, 0x9

    aput v15, v20, v21

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 845
    .local v17, "minuteSecondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v16 .. v17}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 848
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 849
    .local v4, "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 852
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x6

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 853
    .local v18, "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 855
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 858
    new-instance v19, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v12, v20, v21

    const/16 v21, 0x1

    aput v13, v20, v21

    const/16 v21, 0x2

    aput v14, v20, v21

    const/16 v21, 0x3

    aput v15, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 860
    .local v19, "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 863
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v12, v20, v21

    const/16 v21, 0x1

    aput v13, v20, v21

    const/16 v21, 0x2

    aput v14, v20, v21

    const/16 v21, 0x3

    aput v15, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 864
    .restart local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 866
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 869
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v8, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 870
    .restart local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 873
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 874
    .restart local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 876
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 879
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v10, v20, v21

    const/16 v21, 0x1

    aput v11, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 880
    .restart local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 882
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 885
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x7

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v9, v20, v21

    const/16 v21, 0x1

    aput v10, v20, v21

    const/16 v21, 0x2

    aput v11, v20, v21

    const/16 v21, 0x3

    aput v12, v20, v21

    const/16 v21, 0x4

    aput v13, v20, v21

    const/16 v21, 0x5

    aput v14, v20, v21

    const/16 v21, 0x6

    aput v15, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 886
    .restart local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 888
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 951
    .end local v16    # "minuteFirstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .end local v17    # "minuteSecondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    :goto_200
    return-void

    .line 892
    .end local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .end local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    .end local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    :cond_201
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v22

    aput v22, v20, v21

    const/16 v21, 0x1

    const/16 v22, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v22

    aput v22, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v3, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 895
    .local v3, "ampm":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v7, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 896
    .restart local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 898
    invoke-virtual {v4, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 901
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 902
    .restart local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 904
    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 907
    new-instance v19, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0x6

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 908
    .restart local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 910
    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 914
    new-instance v5, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    const/16 v20, 0xa

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    const/16 v21, 0x6

    aput v12, v20, v21

    const/16 v21, 0x7

    aput v13, v20, v21

    const/16 v21, 0x8

    aput v14, v20, v21

    const/16 v21, 0x9

    aput v15, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v5, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 915
    .local v5, "fourthDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 917
    invoke-virtual {v5, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 920
    new-instance v19, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v12, v20, v21

    const/16 v21, 0x1

    aput v13, v20, v21

    const/16 v21, 0x2

    aput v14, v20, v21

    const/16 v21, 0x3

    aput v15, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 921
    .restart local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 923
    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 926
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v9, v20, v21

    const/16 v21, 0x1

    aput v10, v20, v21

    const/16 v21, 0x2

    aput v11, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 927
    .restart local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 930
    new-instance v19, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0xa

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    const/16 v21, 0x6

    aput v12, v20, v21

    const/16 v21, 0x7

    aput v13, v20, v21

    const/16 v21, 0x8

    aput v14, v20, v21

    const/16 v21, 0x9

    aput v15, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 931
    .restart local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 933
    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 936
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x8

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v8, v20, v21

    const/16 v21, 0x1

    aput v9, v20, v21

    const/16 v21, 0x2

    aput v10, v20, v21

    const/16 v21, 0x3

    aput v11, v20, v21

    const/16 v21, 0x4

    aput v12, v20, v21

    const/16 v21, 0x5

    aput v13, v20, v21

    const/16 v21, 0x6

    aput v14, v20, v21

    const/16 v21, 0x7

    aput v15, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 937
    .restart local v4    # "firstDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 939
    invoke-virtual {v4, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 942
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0x6

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 943
    .restart local v18    # "secondDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 946
    new-instance v19, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .end local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    const/16 v20, 0xa

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput v6, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    const/16 v21, 0x2

    aput v8, v20, v21

    const/16 v21, 0x3

    aput v9, v20, v21

    const/16 v21, 0x4

    aput v10, v20, v21

    const/16 v21, 0x5

    aput v11, v20, v21

    const/16 v21, 0x6

    aput v12, v20, v21

    const/16 v21, 0x7

    aput v13, v20, v21

    const/16 v21, 0x8

    aput v14, v20, v21

    const/16 v21, 0x9

    aput v15, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;[I)V

    .line 947
    .restart local v19    # "thirdDigit":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;
    invoke-virtual/range {v18 .. v19}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    .line 949
    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->addChild(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;)V

    goto/16 :goto_200
.end method

.method private getAmOrPmKeyCode(I)I
    .registers 13
    .param p1, "amOrPm"    # I

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v5, -0x1

    .line 792
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    if-eq v6, v5, :cond_c

    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    if-ne v6, v5, :cond_61

    .line 794
    :cond_c
    invoke-static {v5}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object v3

    .line 797
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

    .line 798
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 799
    .local v0, "amChar":C
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 800
    .local v4, "pmChar":C
    if-eq v0, v4, :cond_6e

    .line 801
    new-array v6, v10, [C

    aput-char v0, v6, v8

    aput-char v4, v6, v9

    invoke-virtual {v3, v6}, Landroid/view/KeyCharacterMap;->getEvents([C)[Landroid/view/KeyEvent;

    move-result-object v1

    .line 803
    .local v1, "events":[Landroid/view/KeyEvent;
    if-eqz v1, :cond_66

    array-length v6, v1

    const/4 v7, 0x4

    if-ne v6, v7, :cond_66

    .line 804
    aget-object v6, v1, v8

    invoke-virtual {v6}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v6

    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    .line 805
    aget-object v6, v1, v10

    invoke-virtual {v6}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v6

    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    .line 813
    .end local v0    # "amChar":C
    .end local v1    # "events":[Landroid/view/KeyEvent;
    .end local v2    # "i":I
    .end local v3    # "kcm":Landroid/view/KeyCharacterMap;
    .end local v4    # "pmChar":C
    :cond_61
    :goto_61
    if-nez p1, :cond_71

    .line 814
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    .line 819
    :cond_65
    :goto_65
    return v5

    .line 807
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

    .line 797
    .end local v1    # "events":[Landroid/view/KeyEvent;
    :cond_6e
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 815
    .end local v0    # "amChar":C
    .end local v2    # "i":I
    .end local v3    # "kcm":Landroid/view/KeyCharacterMap;
    .end local v4    # "pmChar":C
    :cond_71
    if-ne p1, v9, :cond_65

    .line 816
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    goto :goto_65
.end method

.method private getEnteredTime([Ljava/lang/Boolean;)[I
    .registers 13
    .param p1, "enteredZeros"    # [Ljava/lang/Boolean;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 752
    const/4 v0, -0x1

    .line 753
    .local v0, "amOrPm":I
    const/4 v5, 0x1

    .line 754
    .local v5, "startIndex":I
    iget-boolean v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v7, :cond_2a

    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 755
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

    .line 756
    .local v3, "keyCode":I
    invoke-direct {p0, v10}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v7

    if-ne v3, v7, :cond_52

    .line 757
    const/4 v0, 0x0

    .line 761
    :cond_29
    :goto_29
    const/4 v5, 0x2

    .line 763
    .end local v3    # "keyCode":I
    :cond_2a
    const/4 v4, -0x1

    .line 764
    .local v4, "minute":I
    const/4 v1, -0x1

    .line 765
    .local v1, "hour":I
    move v2, v5

    .local v2, "i":I
    :goto_2d
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-gt v2, v7, :cond_84

    .line 766
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

    .line 767
    .local v6, "val":I
    if-ne v2, v5, :cond_5a

    .line 768
    move v4, v6

    .line 765
    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 758
    .end local v1    # "hour":I
    .end local v2    # "i":I
    .end local v4    # "minute":I
    .end local v6    # "val":I
    .restart local v3    # "keyCode":I
    :cond_52
    invoke-direct {p0, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v7

    if-ne v3, v7, :cond_29

    .line 759
    const/4 v0, 0x1

    goto :goto_29

    .line 769
    .end local v3    # "keyCode":I
    .restart local v1    # "hour":I
    .restart local v2    # "i":I
    .restart local v4    # "minute":I
    .restart local v6    # "val":I
    :cond_5a
    add-int/lit8 v7, v5, 0x1

    if-ne v2, v7, :cond_6c

    .line 770
    mul-int/lit8 v7, v6, 0xa

    add-int/2addr v4, v7

    .line 771
    if-eqz p1, :cond_4f

    if-nez v6, :cond_4f

    .line 772
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, p1, v9

    goto :goto_4f

    .line 774
    :cond_6c
    add-int/lit8 v7, v5, 0x2

    if-ne v2, v7, :cond_72

    .line 775
    move v1, v6

    goto :goto_4f

    .line 776
    :cond_72
    add-int/lit8 v7, v5, 0x3

    if-ne v2, v7, :cond_4f

    .line 777
    mul-int/lit8 v7, v6, 0xa

    add-int/2addr v1, v7

    .line 778
    if-eqz p1, :cond_4f

    if-nez v6, :cond_4f

    .line 779
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, p1, v10

    goto :goto_4f

    .line 784
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
    .line 717
    packed-switch p0, :pswitch_data_1c

    .line 739
    const/4 v0, -0x1

    :goto_4
    return v0

    .line 719
    :pswitch_5
    const/4 v0, 0x0

    goto :goto_4

    .line 721
    :pswitch_7
    const/4 v0, 0x1

    goto :goto_4

    .line 723
    :pswitch_9
    const/4 v0, 0x2

    goto :goto_4

    .line 725
    :pswitch_b
    const/4 v0, 0x3

    goto :goto_4

    .line 727
    :pswitch_d
    const/4 v0, 0x4

    goto :goto_4

    .line 729
    :pswitch_f
    const/4 v0, 0x5

    goto :goto_4

    .line 731
    :pswitch_11
    const/4 v0, 0x6

    goto :goto_4

    .line 733
    :pswitch_13
    const/4 v0, 0x7

    goto :goto_4

    .line 735
    :pswitch_15
    const/16 v0, 0x8

    goto :goto_4

    .line 737
    :pswitch_18
    const/16 v0, 0x9

    goto :goto_4

    .line 717
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

    .line 636
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v3, :cond_1c

    .line 639
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getEnteredTime([Ljava/lang/Boolean;)[I

    move-result-object v0

    .line 640
    .local v0, "values":[I
    aget v3, v0, v2

    if-ltz v3, :cond_1a

    aget v3, v0, v1

    if-ltz v3, :cond_1a

    aget v3, v0, v1

    const/16 v4, 0x3c

    if-ge v3, v4, :cond_1a

    .line 644
    .end local v0    # "values":[I
    :goto_19
    return v1

    .restart local v0    # "values":[I
    :cond_1a
    move v1, v2

    .line 640
    goto :goto_19

    .line 644
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
    .line 622
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mLegalTimesTree:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    .line 623
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

    .line 624
    .local v1, "keyCode":I
    invoke-virtual {v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;->canReach(I)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Node;

    move-result-object v2

    .line 625
    if-nez v2, :cond_8

    .line 626
    const/4 v3, 0x0

    .line 629
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
    .line 143
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;-><init>()V

    .line 144
    .local v0, "ret":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->initialize(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 145
    return-object v0
.end method

.method private processKeyUp(I)Z
    .registers 9
    .param p1, "keyCode"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 507
    const/16 v4, 0x6f

    if-eq p1, v4, :cond_9

    const/4 v4, 0x4

    if-ne p1, v4, :cond_13

    .line 508
    :cond_9
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isCancelable()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->dismiss()V

    .line 570
    :cond_12
    :goto_12
    return v2

    .line 510
    :cond_13
    const/16 v4, 0x3d

    if-ne p1, v4, :cond_25

    .line 511
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v4, :cond_7f

    .line 512
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 513
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    goto :goto_12

    .line 517
    :cond_25
    const/16 v4, 0x42

    if-ne p1, v4, :cond_51

    .line 518
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v4, :cond_36

    .line 519
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 522
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    .line 524
    :cond_36
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    if-eqz v3, :cond_4d

    .line 525
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v5

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v6

    invoke-interface {v3, v4, v5, v6}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;->onTimeSet(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;II)V

    .line 528
    :cond_4d
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->dismiss()V

    goto :goto_12

    .line 530
    :cond_51
    const/16 v4, 0x43

    if-ne p1, v4, :cond_9d

    .line 531
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v4, :cond_7f

    .line 532
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7f

    .line 533
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->deleteLastTypedKey()I

    move-result v0

    .line 535
    .local v0, "deleted":I
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    if-ne v0, v4, :cond_81

    .line 536
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    .line 542
    .local v1, "deletedKeyStr":Ljava/lang/String;
    :goto_6d
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDeletedKeyFormat:Ljava/lang/String;

    new-array v6, v2, [Ljava/lang/Object;

    aput-object v1, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 544
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    .end local v0    # "deleted":I
    .end local v1    # "deletedKeyStr":Ljava/lang/String;
    :cond_7f
    move v2, v3

    .line 570
    goto :goto_12

    .line 537
    .restart local v0    # "deleted":I
    :cond_81
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getAmOrPmKeyCode(I)I

    move-result v4

    if-ne v0, v4, :cond_8a

    .line 538
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    .restart local v1    # "deletedKeyStr":Ljava/lang/String;
    goto :goto_6d

    .line 540
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

    .line 547
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

    .line 554
    :cond_d4
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-nez v4, :cond_ef

    .line 555
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    if-nez v3, :cond_e5

    .line 557
    const-string v3, "TimePickerDialog"

    const-string v4, "Unable to initiate keyboard mode, TimePicker was null."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_12

    .line 560
    :cond_e5
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 561
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryStartingKbMode(I)V

    goto/16 :goto_12

    .line 565
    :cond_ef
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->addKeyIfLegal(I)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 566
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
    .line 467
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setCurrentItemShowing(IZ)V

    .line 470
    if-nez p1, :cond_64

    .line 471
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v1

    .line 472
    .local v1, "hours":I
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v6, :cond_13

    .line 473
    rem-int/lit8 v1, v1, 0xc

    .line 475
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

    .line 476
    if-eqz p4, :cond_3a

    .line 477
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectHours:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 479
    :cond_3a
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    .line 489
    .end local v1    # "hours":I
    .local v2, "labelToAnimate":Landroid/widget/TextView;
    :goto_3c
    if-nez p1, :cond_94

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectedColor:I

    .line 490
    .local v0, "hourColor":I
    :goto_40
    const/4 v6, 0x1

    if-ne p1, v6, :cond_97

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectedColor:I

    .line 491
    .local v3, "minuteColor":I
    :goto_45
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 492
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 494
    const v6, 0x3f59999a    # 0.85f

    const v7, 0x3f8ccccd    # 1.1f

    invoke-static {v2, v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 495
    .local v5, "pulseAnimator":Landroid/animation/ObjectAnimator;
    if-eqz p3, :cond_60

    .line 496
    const-wide/16 v6, 0x12c

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 498
    :cond_60
    invoke-virtual {v5}, Landroid/animation/ObjectAnimator;->start()V

    .line 499
    return-void

    .line 481
    .end local v0    # "hourColor":I
    .end local v2    # "labelToAnimate":Landroid/widget/TextView;
    .end local v3    # "minuteColor":I
    .end local v5    # "pulseAnimator":Landroid/animation/ObjectAnimator;
    :cond_64
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v4

    .line 482
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

    .line 483
    if-eqz p4, :cond_91

    .line 484
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectMinutes:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 486
    :cond_91
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    .restart local v2    # "labelToAnimate":Landroid/widget/TextView;
    goto :goto_3c

    .line 489
    .end local v4    # "minutes":I
    :cond_94
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    goto :goto_40

    .line 490
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
    .line 436
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v2, :cond_26

    .line 437
    const-string v0, "%02d"

    .line 446
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

    .line 447
    .local v1, "text":Ljava/lang/CharSequence;
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourSpaceView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 449
    if-eqz p2, :cond_25

    .line 450
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-static {v2, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 452
    :cond_25
    return-void

    .line 439
    .end local v0    # "format":Ljava/lang/String;
    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_26
    const-string v0, "%d"

    .line 440
    .restart local v0    # "format":Ljava/lang/String;
    rem-int/lit8 p1, p1, 0xc

    .line 441
    if-nez p1, :cond_6

    .line 442
    const/16 p1, 0xc

    goto :goto_6
.end method

.method private setMinute(I)V
    .registers 8
    .param p1, "value"    # I

    .prologue
    .line 455
    const/16 v1, 0x3c

    if-ne p1, v1, :cond_5

    .line 456
    const/4 p1, 0x0

    .line 458
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

    .line 459
    .local v0, "text":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-static {v1, v0}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 460
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 461
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteSpaceView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    return-void
.end method

.method private tryStartingKbMode(I)V
    .registers 4
    .param p1, "keyCode"    # I

    .prologue
    const/4 v1, 0x0

    .line 581
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->trySettingInputEnabled(Z)Z

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v0, -0x1

    if-eq p1, v0, :cond_12

    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->addKeyIfLegal(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 583
    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 584
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 585
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateDisplay(Z)V

    .line 587
    :cond_1d
    return-void
.end method

.method private updateAmPmDisplay(I)V
    .registers 4
    .param p1, "amOrPm"    # I

    .prologue
    .line 377
    if-nez p1, :cond_18

    .line 378
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 379
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 380
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 388
    :goto_17
    return-void

    .line 381
    :cond_18
    const/4 v0, 0x1

    if-ne p1, v0, :cond_31

    .line 382
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 383
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 384
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_17

    .line 386
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
    .line 685
    if-nez p1, :cond_3e

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3e

    .line 686
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v1

    .line 687
    .local v1, "hour":I
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v4

    .line 688
    .local v4, "minute":I
    const/4 v8, 0x1

    invoke-direct {p0, v1, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setHour(IZ)V

    .line 689
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setMinute(I)V

    .line 690
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v8, :cond_29

    .line 691
    const/16 v8, 0xc

    if-ge v1, v8, :cond_3c

    const/4 v8, 0x0

    :goto_26
    invoke-direct {p0, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    .line 693
    :cond_29
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v8

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-direct {p0, v8, v9, v10, v11}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    .line 694
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setEnabled(Z)V

    .line 714
    .end local v1    # "hour":I
    .end local v4    # "minute":I
    :cond_3b
    :goto_3b
    return-void

    .line 691
    .restart local v1    # "hour":I
    .restart local v4    # "minute":I
    :cond_3c
    const/4 v8, 0x1

    goto :goto_26

    .line 696
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

    .line 697
    .local v0, "enteredZeros":[Ljava/lang/Boolean;
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getEnteredTime([Ljava/lang/Boolean;)[I

    move-result-object v7

    .line 698
    .local v7, "values":[I
    const/4 v8, 0x0

    aget-object v8, v0, v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_a8

    const-string v2, "%02d"

    .line 699
    .local v2, "hourFormat":Ljava/lang/String;
    :goto_60
    const/4 v8, 0x1

    aget-object v8, v0, v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_ab

    const-string v5, "%02d"

    .line 700
    .local v5, "minuteFormat":Ljava/lang/String;
    :goto_6b
    const/4 v8, 0x0

    aget v8, v7, v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_ae

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    .line 702
    .local v3, "hourStr":Ljava/lang/String;
    :goto_73
    const/4 v8, 0x1

    aget v8, v7, v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_c8

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    .line 704
    .local v6, "minuteStr":Ljava/lang/String;
    :goto_7b
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourSpaceView:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 706
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 707
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 708
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteSpaceView:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 709
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 710
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-nez v8, :cond_3b

    .line 711
    const/4 v8, 0x2

    aget v8, v7, v8

    invoke-direct {p0, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    goto :goto_3b

    .line 698
    .end local v2    # "hourFormat":Ljava/lang/String;
    .end local v3    # "hourStr":Ljava/lang/String;
    .end local v5    # "minuteFormat":Ljava/lang/String;
    .end local v6    # "minuteStr":Ljava/lang/String;
    :cond_a8
    const-string v2, "%2d"

    goto :goto_60

    .line 699
    .restart local v2    # "hourFormat":Ljava/lang/String;
    :cond_ab
    const-string v5, "%2d"

    goto :goto_6b

    .line 700
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

    .line 702
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
.method public initialize(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;IIZ)V
    .registers 6
    .param p1, "callback"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;
    .param p2, "hourOfDay"    # I
    .param p3, "minute"    # I
    .param p4, "is24HourMode"    # Z

    .prologue
    const/4 v0, 0x0

    .line 150
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    .line 152
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    .line 153
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    .line 154
    iput-boolean p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    .line 155
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 156
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    .line 157
    return-void
.end method

.method public isThemeDark()Z
    .registers 2

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 182
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 183
    if-eqz p1, :cond_45

    const-string v0, "hour_of_day"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    const-string v0, "minute"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    const-string v0, "is_24_hour_view"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 186
    const-string v0, "hour_of_day"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    .line 187
    const-string v0, "minute"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    .line 188
    const-string v0, "is_24_hour_view"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    .line 189
    const-string v0, "in_kb_mode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 190
    const-string v0, "dark_theme"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    .line 192
    :cond_45
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 32
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 197
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/Window;->requestFeature(I)Z

    .line 199
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$layout;->mdtp_time_picker_dialog:I

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v26

    .line 200
    .local v26, "view":Landroid/view/View;
    new-instance v18, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;

    const/4 v2, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$1;)V

    .line 201
    .local v18, "keyboardListener":Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$KeyboardListener;
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->time_picker_dialog:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 203
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    .line 204
    .local v23, "res":Landroid/content/res/Resources;
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_hour_picker_description:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourPickerDescription:Ljava/lang/String;

    .line 205
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_hours:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectHours:Ljava/lang/String;

    .line 206
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_minute_picker_description:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinutePickerDescription:Ljava/lang/String;

    .line 207
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_select_minutes:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectMinutes:Ljava/lang/String;

    .line 208
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mSelectedColor:I

    .line 209
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color_focused:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mUnselectedColor:I

    .line 211
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->hours:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    .line 212
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 213
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->hour_space:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourSpaceView:Landroid/widget/TextView;

    .line 214
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->minutes_space:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteSpaceView:Landroid/widget/TextView;

    .line 215
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->minutes:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    .line 216
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 217
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->ampm_label:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    .line 218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 219
    new-instance v2, Ljava/text/DateFormatSymbols;

    invoke-direct {v2}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v2}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v9

    .line 220
    .local v9, "amPmTexts":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v9, v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmText:Ljava/lang/String;

    .line 221
    const/4 v2, 0x1

    aget-object v2, v9, v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmText:Ljava/lang/String;

    .line 223
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    .line 225
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->time_picker:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 226
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnValueSelectedListener(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 228
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    invoke-virtual/range {v2 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->initialize(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;IIZ)V

    .line 231
    const/4 v11, 0x0

    .line 232
    .local v11, "currentItemShowing":I
    if-eqz p3, :cond_14d

    const-string v2, "current_item_showing"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14d

    .line 234
    const-string v2, "current_item_showing"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    .line 236
    :cond_14d
    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v2, v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    .line 237
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->invalidate()V

    .line 239
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$1;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$1;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mMinuteView:Landroid/widget/TextView;

    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$2;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->ok:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    .line 255
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$3;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$3;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 270
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mOkButton:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "Roboto-Medium"

    invoke-static {v3, v4}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 273
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->cancel:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/Button;

    .line 274
    .local v21, "mCancelButton":Landroid/widget/Button;
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$4;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Roboto-Medium"

    invoke-static {v2, v3}, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 282
    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isCancelable()Z

    move-result v2

    if-eqz v2, :cond_302

    const/4 v2, 0x0

    :goto_1e2
    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 285
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->ampm_hitspace:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    .line 286
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    if-eqz v2, :cond_306

    .line 287
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 289
    new-instance v22, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    move-object/from16 v0, v22

    invoke-direct {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 291
    .local v22, "paramsSeparator":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xd

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 292
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$id;->separator:I

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v24

    check-cast v24, Landroid/widget/TextView;

    .line 293
    .local v24, "separatorView":Landroid/widget/TextView;
    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 313
    .end local v22    # "paramsSeparator":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v24    # "separatorView":Landroid/widget/TextView;
    :goto_223
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAllowAutoAdvance:Z

    .line 314
    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setHour(IZ)V

    .line 315
    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setMinute(I)V

    .line 318
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_time_placeholder:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    .line 319
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_deleted_key:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDeletedKeyFormat:Ljava/lang/String;

    .line 320
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mDoublePlaceholderText:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    move-object/from16 v0, p0

    iput-char v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPlaceholderText:C

    .line 321
    const/4 v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mPmKeyCode:I

    move-object/from16 v0, p0

    iput v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmKeyCode:I

    .line 322
    invoke-direct/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->generateLegalTimesTree()V

    .line 323
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v2, :cond_32e

    .line 324
    const-string v2, "typed_times"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    .line 325
    const/4 v2, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->tryStartingKbMode(I)V

    .line 326
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHourView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->invalidate()V

    .line 332
    :cond_28b
    :goto_28b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    invoke-virtual {v2, v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setTheme(Landroid/content/Context;Z)V

    .line 334
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v27

    .line 335
    .local v27, "white":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    .line 336
    .local v8, "accent":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_circle_background:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    .line 337
    .local v10, "circleBackground":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_line_background:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v20

    .line 338
    .local v20, "line":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_numbers_text_color:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v25

    .line 339
    .local v25, "timeDisplay":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_done_text_color:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v17

    .line 340
    .local v17, "doneTextColor":Landroid/content/res/ColorStateList;
    sget v16, Lcom/wdullaer/materialdatetimepicker/R$drawable;->mdtp_done_background_color:I

    .line 342
    .local v16, "doneBackground":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_dark_gray:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v14

    .line 343
    .local v14, "darkGray":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_light_gray:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    .line 344
    .local v19, "lightGray":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_line_dark:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v15

    .line 345
    .local v15, "darkLine":I
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_done_text_color_dark:I

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    .line 346
    .local v13, "darkDoneTextColor":Landroid/content/res/ColorStateList;
    sget v12, Lcom/wdullaer/materialdatetimepicker/R$drawable;->mdtp_done_background_color_dark:I

    .line 355
    .local v12, "darkDoneBackground":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    if-eqz v3, :cond_33f

    .end local v19    # "lightGray":I
    :goto_2fc
    move/from16 v0, v19

    invoke-virtual {v2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setBackgroundColor(I)V

    .line 357
    return-object v26

    .line 282
    .end local v8    # "accent":I
    .end local v10    # "circleBackground":I
    .end local v12    # "darkDoneBackground":I
    .end local v13    # "darkDoneTextColor":Landroid/content/res/ColorStateList;
    .end local v14    # "darkGray":I
    .end local v15    # "darkLine":I
    .end local v16    # "doneBackground":I
    .end local v17    # "doneTextColor":Landroid/content/res/ColorStateList;
    .end local v20    # "line":I
    .end local v25    # "timeDisplay":I
    .end local v27    # "white":I
    :cond_302
    const/16 v2, 0x8

    goto/16 :goto_1e2

    .line 295
    :cond_306
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmTextView:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 296
    move-object/from16 v0, p0

    iget v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    const/16 v3, 0xc

    if-ge v2, v3, :cond_32c

    const/4 v2, 0x0

    :goto_317
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    .line 297
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAmPmHitspace:Landroid/view/View;

    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$5;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_223

    .line 296
    :cond_32c
    const/4 v2, 0x1

    goto :goto_317

    .line 327
    :cond_32e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    if-nez v2, :cond_28b

    .line 328
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    goto/16 :goto_28b

    .restart local v8    # "accent":I
    .restart local v10    # "circleBackground":I
    .restart local v12    # "darkDoneBackground":I
    .restart local v13    # "darkDoneTextColor":Landroid/content/res/ColorStateList;
    .restart local v14    # "darkGray":I
    .restart local v15    # "darkLine":I
    .restart local v16    # "doneBackground":I
    .restart local v17    # "doneTextColor":Landroid/content/res/ColorStateList;
    .restart local v19    # "lightGray":I
    .restart local v20    # "line":I
    .restart local v25    # "timeDisplay":I
    .restart local v27    # "white":I
    :cond_33f
    move/from16 v19, v10

    .line 355
    goto :goto_2fc
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 368
    invoke-super {p0}, Landroid/app/DialogFragment;->onPause()V

    .line 369
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->stop()V

    .line 370
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 362
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 363
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->start()V

    .line 364
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 392
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    if-eqz v0, :cond_45

    .line 393
    const-string v0, "hour_of_day"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 394
    const-string v0, "minute"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 395
    const-string v0, "is_24_hour_view"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mIs24HourMode:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 396
    const-string v0, "current_item_showing"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 397
    const-string v0, "in_kb_mode"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 398
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    if-eqz v0, :cond_3e

    .line 399
    const-string v0, "typed_times"

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 401
    :cond_3e
    const-string v0, "dark_theme"

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 403
    :cond_45
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

    .line 410
    if-nez p1, :cond_5c

    .line 411
    invoke-direct {p0, p2, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setHour(IZ)V

    .line 412
    const-string v1, "%d"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, "announcement":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mAllowAutoAdvance:Z

    if-eqz v1, :cond_3d

    if-eqz p3, :cond_3d

    .line 414
    invoke-direct {p0, v4, v4, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setCurrentItemShowing(IZZZ)V

    .line 415
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

    .line 420
    :goto_37
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTimePicker:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-static {v1, v0}, Lcom/wdullaer/materialdatetimepicker/Utils;->tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 432
    .end local v0    # "announcement":Ljava/lang/String;
    :cond_3c
    :goto_3c
    return-void

    .line 417
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

    .line 421
    .end local v0    # "announcement":Ljava/lang/String;
    :cond_5c
    if-ne p1, v4, :cond_80

    .line 422
    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->setMinute(I)V

    .line 423
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

    .line 424
    :cond_80
    const/4 v1, 0x2

    if-ne p1, v1, :cond_87

    .line 425
    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->updateAmPmDisplay(I)V

    goto :goto_3c

    .line 426
    :cond_87
    const/4 v1, 0x3

    if-ne p1, v1, :cond_3c

    .line 427
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->isTypedTimeFullyLegal()Z

    move-result v1

    if-nez v1, :cond_95

    .line 428
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mTypedTimes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 430
    :cond_95
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->finishKbMode(Z)V

    goto :goto_3c
.end method

.method public setOnTimeSetListener(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;)V
    .registers 2
    .param p1, "callback"    # Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mCallback:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$OnTimeSetListener;

    .line 172
    return-void
.end method

.method public setStartTime(II)V
    .registers 4
    .param p1, "hourOfDay"    # I
    .param p2, "minute"    # I

    .prologue
    .line 175
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialHourOfDay:I

    .line 176
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInitialMinute:I

    .line 177
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mInKbMode:Z

    .line 178
    return-void
.end method

.method public setThemeDark(Z)V
    .registers 2
    .param p1, "dark"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mThemeDark:Z

    .line 164
    return-void
.end method

.method public tryVibrate()V
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->mHapticFeedbackController:Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->tryVibrate()V

    .line 374
    return-void
.end method
