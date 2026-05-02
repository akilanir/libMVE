.class public Lorg/ligi/axt/AXT;
.super Ljava/lang/Object;
.source "AXT.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static at(Landroid/app/Activity;)Lorg/ligi/axt/extensions/ActivityAXT;
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 46
    new-instance v0, Lorg/ligi/axt/extensions/ActivityAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/ActivityAXT;-><init>(Landroid/app/Activity;)V

    return-object v0
.end method

.method public static at([Ljava/lang/Object;)Lorg/ligi/axt/extensions/ArrayAXT;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lorg/ligi/axt/extensions/ArrayAXT",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "arr":[Ljava/lang/Object;, "[TT;"
    new-instance v0, Lorg/ligi/axt/extensions/ArrayAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/ArrayAXT;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public static at(Landroid/graphics/Bitmap;)Lorg/ligi/axt/extensions/BitmapAXT;
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 42
    new-instance v0, Lorg/ligi/axt/extensions/BitmapAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/BitmapAXT;-><init>(Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method public static at(Landroid/widget/CheckBox;)Lorg/ligi/axt/extensions/CheckBoxAXT;
    .registers 2
    .param p0, "checkBox"    # Landroid/widget/CheckBox;

    .prologue
    .line 38
    new-instance v0, Lorg/ligi/axt/extensions/CheckBoxAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/CheckBoxAXT;-><init>(Landroid/widget/CheckBox;)V

    return-object v0
.end method

.method public static at(Landroid/content/Context;)Lorg/ligi/axt/extensions/ContextAXT;
    .registers 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 74
    new-instance v0, Lorg/ligi/axt/extensions/ContextAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/ContextAXT;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static at(Landroid/widget/EditText;)Lorg/ligi/axt/extensions/EditTextAXT;
    .registers 2
    .param p0, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 70
    new-instance v0, Lorg/ligi/axt/extensions/EditTextAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/EditTextAXT;-><init>(Landroid/widget/EditText;)V

    return-object v0
.end method

.method public static at(Ljava/io/File;)Lorg/ligi/axt/extensions/FileAXT;
    .registers 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 54
    new-instance v0, Lorg/ligi/axt/extensions/FileAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/FileAXT;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public static at(Landroid/app/Fragment;)Lorg/ligi/axt/extensions/FragmentAXT;
    .registers 2
    .param p0, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 50
    new-instance v0, Lorg/ligi/axt/extensions/FragmentAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/FragmentAXT;-><init>(Landroid/app/Fragment;)V

    return-object v0
.end method

.method public static at(Ljava/io/InputStream;)Lorg/ligi/axt/extensions/InputStreamAXT;
    .registers 2
    .param p0, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 78
    new-instance v0, Lorg/ligi/axt/extensions/InputStreamAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/InputStreamAXT;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public static at(Landroid/content/Intent;)Lorg/ligi/axt/extensions/IntentAXT;
    .registers 2
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 62
    new-instance v0, Lorg/ligi/axt/extensions/IntentAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/IntentAXT;-><init>(Landroid/content/Intent;)V

    return-object v0
.end method

.method public static at(Landroid/graphics/Paint;)Lorg/ligi/axt/extensions/PaintAXT;
    .registers 2
    .param p0, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 86
    new-instance v0, Lorg/ligi/axt/extensions/PaintAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/PaintAXT;-><init>(Landroid/graphics/Paint;)V

    return-object v0
.end method

.method public static at(Landroid/content/pm/ResolveInfo;)Lorg/ligi/axt/extensions/ResolveInfoAXT;
    .registers 2
    .param p0, "resolveInfo"    # Landroid/content/pm/ResolveInfo;

    .prologue
    .line 94
    new-instance v0, Lorg/ligi/axt/extensions/ResolveInfoAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/ResolveInfoAXT;-><init>(Landroid/content/pm/ResolveInfo;)V

    return-object v0
.end method

.method public static at(Ljava/lang/String;)Lorg/ligi/axt/extensions/StringAXT;
    .registers 2
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v0, Lorg/ligi/axt/extensions/StringAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/StringAXT;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static at(Ljava/net/URL;)Lorg/ligi/axt/extensions/URLAXT;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 66
    new-instance v0, Lorg/ligi/axt/extensions/URLAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/URLAXT;-><init>(Ljava/net/URL;)V

    return-object v0
.end method

.method public static at(Landroid/net/Uri;)Lorg/ligi/axt/extensions/UriAXT;
    .registers 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 102
    new-instance v0, Lorg/ligi/axt/extensions/UriAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/UriAXT;-><init>(Landroid/net/Uri;)V

    return-object v0
.end method

.method public static at(Landroid/view/View;)Lorg/ligi/axt/extensions/ViewAXT;
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 82
    new-instance v0, Lorg/ligi/axt/extensions/ViewAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/ViewAXT;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static at(Landroid/view/WindowManager;)Lorg/ligi/axt/extensions/WindowManagerAXT;
    .registers 2
    .param p0, "windowManager"    # Landroid/view/WindowManager;

    .prologue
    .line 90
    new-instance v0, Lorg/ligi/axt/extensions/WindowManagerAXT;

    invoke-direct {v0, p0}, Lorg/ligi/axt/extensions/WindowManagerAXT;-><init>(Landroid/view/WindowManager;)V

    return-object v0
.end method
