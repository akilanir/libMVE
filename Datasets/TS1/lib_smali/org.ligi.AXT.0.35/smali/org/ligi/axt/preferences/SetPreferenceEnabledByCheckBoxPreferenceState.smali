.class public Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;
.super Ljava/lang/Object;
.source "SetPreferenceEnabledByCheckBoxPreferenceState.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private pref:Landroid/preference/CheckBoxPreference;

.field private preference_vector:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Landroid/preference/Preference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/preference/CheckBoxPreference;)V
    .registers 3
    .param p1, "pref"    # Landroid/preference/CheckBoxPreference;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;->pref:Landroid/preference/CheckBoxPreference;

    .line 40
    invoke-virtual {p1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;->preference_vector:Ljava/util/Vector;

    .line 42
    return-void
.end method


# virtual methods
.method public addPreference2SetEnable(Landroid/preference/Preference;)Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;
    .registers 3
    .param p1, "new_p"    # Landroid/preference/Preference;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;->preference_vector:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 46
    iget-object v0, p0, Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;->pref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 47
    return-object p0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 6
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 51
    iget-object v1, p0, Lorg/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState;->preference_vector:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/Preference;

    .local v0, "p":Landroid/preference/Preference;
    move-object v1, p2

    .line 52
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_6

    .line 54
    .end local v0    # "p":Landroid/preference/Preference;
    :cond_1d
    const/4 v1, 0x1

    return v1
.end method
