.class public Lorg/ligi/axt/preferences/TimePreference;
.super Landroid/preference/DialogPreference;
.source "TimePreference.java"

# interfaces
.implements Landroid/widget/TimePicker$OnTimeChangedListener;


# static fields
.field private static final VALIDATION_EXPRESSION:Ljava/lang/String; = "[0-2]*[0-9]:[0-5]*[0-9]"


# instance fields
.field private defaultValue:Ljava/lang/String;

.field private mHour:I

.field private mMinute:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    iput v0, p0, Lorg/ligi/axt/preferences/TimePreference;->mHour:I

    iput v0, p0, Lorg/ligi/axt/preferences/TimePreference;->mMinute:I

    .line 33
    invoke-direct {p0}, Lorg/ligi/axt/preferences/TimePreference;->initialize()V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 75
    iput v0, p0, Lorg/ligi/axt/preferences/TimePreference;->mHour:I

    iput v0, p0, Lorg/ligi/axt/preferences/TimePreference;->mMinute:I

    .line 43
    invoke-direct {p0}, Lorg/ligi/axt/preferences/TimePreference;->initialize()V

    .line 44
    return-void
.end method

.method private getHour()I
    .registers 4

    .prologue
    .line 129
    iget-object v1, p0, Lorg/ligi/axt/preferences/TimePreference;->defaultValue:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/ligi/axt/preferences/TimePreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "time":Ljava/lang/String;
    if-eqz v0, :cond_10

    const-string v1, "[0-2]*[0-9]:[0-5]*[0-9]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 131
    :cond_10
    const/4 v1, -0x1

    .line 134
    :goto_11
    return v1

    :cond_12
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_11
.end method

.method private getMinute()I
    .registers 4

    .prologue
    .line 143
    iget-object v1, p0, Lorg/ligi/axt/preferences/TimePreference;->defaultValue:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/ligi/axt/preferences/TimePreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "time":Ljava/lang/String;
    if-eqz v0, :cond_10

    const-string v1, "[0-2]*[0-9]:[0-5]*[0-9]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 145
    :cond_10
    const/4 v1, -0x1

    .line 148
    :goto_11
    return v1

    :cond_12
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_11
.end method

.method private initialize()V
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/ligi/axt/preferences/TimePreference;->setPersistent(Z)V

    .line 51
    return-void
.end method


# virtual methods
.method protected onCreateDialogView()Landroid/view/View;
    .registers 5

    .prologue
    .line 61
    new-instance v2, Landroid/widget/TimePicker;

    invoke-virtual {p0}, Lorg/ligi/axt/preferences/TimePreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TimePicker;-><init>(Landroid/content/Context;)V

    .line 62
    .local v2, "tp":Landroid/widget/TimePicker;
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    .line 63
    invoke-virtual {v2, p0}, Landroid/widget/TimePicker;->setOnTimeChangedListener(Landroid/widget/TimePicker$OnTimeChangedListener;)V

    .line 65
    invoke-direct {p0}, Lorg/ligi/axt/preferences/TimePreference;->getHour()I

    move-result v0

    .line 66
    .local v0, "h":I
    invoke-direct {p0}, Lorg/ligi/axt/preferences/TimePreference;->getMinute()I

    move-result v1

    .line 67
    .local v1, "m":I
    if-ltz v0, :cond_2e

    if-ltz v1, :cond_2e

    .line 68
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 69
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 72
    :cond_2e
    return-object v2
.end method

.method public onDialogClosed(Z)V
    .registers 5
    .param p1, "positiveResult"    # Z

    .prologue
    .line 91
    if-eqz p1, :cond_29

    .line 92
    invoke-virtual {p0}, Lorg/ligi/axt/preferences/TimePreference;->isPersistent()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lorg/ligi/axt/preferences/TimePreference;->mHour:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/ligi/axt/preferences/TimePreference;->mMinute:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "result":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/ligi/axt/preferences/TimePreference;->persistString(Ljava/lang/String;)Z

    .line 95
    invoke-virtual {p0, v0}, Lorg/ligi/axt/preferences/TimePreference;->callChangeListener(Ljava/lang/Object;)Z

    .line 99
    .end local v0    # "result":Ljava/lang/String;
    :cond_29
    return-void
.end method

.method public onTimeChanged(Landroid/widget/TimePicker;II)V
    .registers 4
    .param p1, "view"    # Landroid/widget/TimePicker;
    .param p2, "hour"    # I
    .param p3, "minute"    # I

    .prologue
    .line 85
    iput p2, p0, Lorg/ligi/axt/preferences/TimePreference;->mHour:I

    .line 86
    iput p3, p0, Lorg/ligi/axt/preferences/TimePreference;->mMinute:I

    .line 87
    return-void
.end method

.method public setDefaultValue(Ljava/lang/Object;)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 110
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 112
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_8

    .line 121
    .end local p1    # "defaultValue":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-void

    .restart local p1    # "defaultValue":Ljava/lang/Object;
    :cond_8
    move-object v0, p1

    .line 116
    check-cast v0, Ljava/lang/String;

    const-string v1, "[0-2]*[0-9]:[0-5]*[0-9]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 120
    check-cast p1, Ljava/lang/String;

    .end local p1    # "defaultValue":Ljava/lang/Object;
    iput-object p1, p0, Lorg/ligi/axt/preferences/TimePreference;->defaultValue:Ljava/lang/String;

    goto :goto_7
.end method
