.class Landroid/support/v7/preference/PreferenceFragmentCompat$1;
.super Landroid/os/Handler;
.source "PreferenceFragmentCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/preference/PreferenceFragmentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;


# direct methods
.method constructor <init>(Landroid/support/v7/preference/PreferenceFragmentCompat;)V
    .registers 2

    .prologue
    .line 133
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$1;->this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 136
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_c

    .line 142
    :goto_5
    return-void

    .line 139
    :pswitch_6
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$1;->this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;

    # invokes: Landroid/support/v7/preference/PreferenceFragmentCompat;->bindPreferences()V
    invoke-static {v0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->access$100(Landroid/support/v7/preference/PreferenceFragmentCompat;)V

    goto :goto_5

    .line 136
    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
