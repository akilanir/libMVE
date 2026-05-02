.class public Lorg/ligi/axt/preferences/SeekBarPreference;
.super Landroid/preference/DialogPreference;
.source "SeekBarPreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field private final context:Landroid/content/Context;

.field private edit_text:Landroid/widget/EditText;

.field private max:I

.field private seek_bar:Landroid/widget/SeekBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    const v0, 0x7fffffff

    iput v0, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->max:I

    .line 42
    iput-object p1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->context:Landroid/content/Context;

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    const v0, 0x7fffffff

    iput v0, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->max:I

    .line 47
    iput-object p1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->context:Landroid/content/Context;

    .line 48
    return-void
.end method


# virtual methods
.method public getMax()I
    .registers 2

    .prologue
    .line 91
    iget v0, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->max:I

    return v0
.end method

.method protected onDialogClosed(Z)V
    .registers 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 79
    if-eqz p1, :cond_1c

    .line 80
    iget-object v0, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/ligi/axt/preferences/SeekBarPreference;->persistInt(I)Z

    .line 81
    invoke-virtual {p0}, Lorg/ligi/axt/preferences/SeekBarPreference;->getOnPreferenceChangeListener()Landroid/preference/Preference$OnPreferenceChangeListener;

    move-result-object v0

    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Landroid/preference/Preference$OnPreferenceChangeListener;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    .line 84
    :cond_1c
    return-void
.end method

.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .registers 8
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, -0x2

    const/16 v2, 0x14

    .line 52
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 53
    .local v0, "layout":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 54
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    const/16 v1, 0x190

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 56
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 59
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->edit_text:Landroid/widget/EditText;

    .line 60
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->edit_text:Landroid/widget/EditText;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 61
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->edit_text:Landroid/widget/EditText;

    invoke-virtual {p0, v5}, Lorg/ligi/axt/preferences/SeekBarPreference;->getPersistedInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 62
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->edit_text:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 65
    new-instance v1, Landroid/widget/SeekBar;

    iget-object v2, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    .line 66
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    iget v2, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->max:I

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 68
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v4, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    invoke-virtual {v1, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 70
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    invoke-virtual {p0, v5}, Lorg/ligi/axt/preferences/SeekBarPreference;->getPersistedInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 72
    iget-object v1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->seek_bar:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 74
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 75
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 76
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 96
    iget-object v0, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->edit_text:Landroid/widget/EditText;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 97
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 100
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 103
    return-void
.end method

.method public setMax(I)V
    .registers 2
    .param p1, "max"    # I

    .prologue
    .line 87
    iput p1, p0, Lorg/ligi/axt/preferences/SeekBarPreference;->max:I

    .line 88
    return-void
.end method
