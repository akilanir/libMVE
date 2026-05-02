.class public abstract Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "AbstractFilePickerActivity.java"

# interfaces
.implements Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/app/AppCompatActivity;",
        "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;"
    }
.end annotation


# static fields
.field public static final EXTRA_ALLOW_CREATE_DIR:Ljava/lang/String; = "nononsense.intent.ALLOW_CREATE_DIR"

.field public static final EXTRA_ALLOW_MULTIPLE:Ljava/lang/String; = "android.intent.extra.ALLOW_MULTIPLE"

.field public static final EXTRA_MODE:Ljava/lang/String; = "nononsense.intent.MODE"

.field public static final EXTRA_PATHS:Ljava/lang/String; = "nononsense.intent.PATHS"

.field public static final EXTRA_START_PATH:Ljava/lang/String; = "nononsense.intent.START_PATH"

.field public static final MODE_DIR:I = 0x1

.field public static final MODE_FILE:I = 0x0

.field public static final MODE_FILE_AND_DIR:I = 0x2

.field protected static final TAG:Ljava/lang/String; = "filepicker_fragment"


# instance fields
.field protected allowCreateDir:Z

.field protected allowMultiple:Z

.field protected mode:I

.field protected startPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity<TT;>;"
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->startPath:Ljava/lang/String;

    .line 79
    iput v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->mode:I

    .line 80
    iput-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowCreateDir:Z

    .line 81
    iput-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowMultiple:Z

    return-void
.end method


# virtual methods
.method protected abstract getFragment(Ljava/lang/String;IZZ)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IZZ)",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>;"
        }
    .end annotation
.end method

.method public onCancelled()V
    .registers 2

    .prologue
    .line 165
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->setResult(I)V

    .line 166
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->finish()V

    .line 167
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 85
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 87
    sget v3, Lcom/nononsenseapps/filepicker/R$layout;->activity_filepicker:I

    invoke-virtual {p0, v3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->setContentView(I)V

    .line 89
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 90
    .local v2, "intent":Landroid/content/Intent;
    if-eqz v2, :cond_34

    .line 91
    const-string v3, "nononsense.intent.START_PATH"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->startPath:Ljava/lang/String;

    .line 92
    const-string v3, "nononsense.intent.MODE"

    iget v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->mode:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->mode:I

    .line 93
    const-string v3, "nononsense.intent.ALLOW_CREATE_DIR"

    iget-boolean v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowCreateDir:Z

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowCreateDir:Z

    .line 95
    const-string v3, "android.intent.extra.ALLOW_MULTIPLE"

    iget-boolean v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowMultiple:Z

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowMultiple:Z

    .line 99
    :cond_34
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 100
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    const-string v3, "filepicker_fragment"

    invoke-virtual {v0, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .line 103
    .local v1, "fragment":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    if-nez v1, :cond_4e

    .line 104
    iget-object v3, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->startPath:Ljava/lang/String;

    iget v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->mode:I

    iget-boolean v5, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowMultiple:Z

    iget-boolean v6, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->allowCreateDir:Z

    invoke-virtual {p0, v3, v4, v5, v6}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->getFragment(Ljava/lang/String;IZZ)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    move-result-object v1

    .line 108
    :cond_4e
    if-eqz v1, :cond_5f

    .line 109
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    sget v4, Lcom/nononsenseapps/filepicker/R$id;->fragment:I

    const-string v5, "filepicker_fragment"

    invoke-virtual {v3, v4, v1, v5}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 114
    :cond_5f
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->setResult(I)V

    .line 115
    return-void
.end method

.method public onFilePicked(Landroid/net/Uri;)V
    .registers 4
    .param p1, "file"    # Landroid/net/Uri;

    .prologue
    .line 128
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity<TT;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 129
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 130
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->setResult(ILandroid/content/Intent;)V

    .line 131
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->finish()V

    .line 132
    return-void
.end method

.method public onFilesPicked(Ljava/util/List;)V
    .registers 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity<TT;>;"
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 138
    .local v2, "i":Landroid/content/Intent;
    const-string v5, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 140
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_48

    .line 141
    const/4 v0, 0x0

    .line 142
    .local v0, "clip":Landroid/content/ClipData;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    .line 143
    .local v1, "file":Landroid/net/Uri;
    if-nez v0, :cond_34

    .line 144
    new-instance v0, Landroid/content/ClipData;

    .end local v0    # "clip":Landroid/content/ClipData;
    const-string v5, "Paths"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/String;

    new-instance v7, Landroid/content/ClipData$Item;

    invoke-direct {v7, v1}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {v0, v5, v6, v7}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    .restart local v0    # "clip":Landroid/content/ClipData;
    goto :goto_16

    .line 147
    :cond_34
    new-instance v5, Landroid/content/ClipData$Item;

    invoke-direct {v5, v1}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-virtual {v0, v5}, Landroid/content/ClipData;->addItem(Landroid/content/ClipData$Item;)V

    goto :goto_16

    .line 150
    .end local v1    # "file":Landroid/net/Uri;
    :cond_3d
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    .line 159
    .end local v0    # "clip":Landroid/content/ClipData;
    :goto_40
    const/4 v5, -0x1

    invoke-virtual {p0, v5, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->setResult(ILandroid/content/Intent;)V

    .line 160
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;->finish()V

    .line 161
    return-void

    .line 152
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_48
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v4, "paths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_51
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_65

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    .line 154
    .restart local v1    # "file":Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_51

    .line 156
    .end local v1    # "file":Landroid/net/Uri;
    :cond_65
    const-string v5, "nononsense.intent.PATHS"

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    goto :goto_40
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 123
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 124
    return-void
.end method
