.class public Lcom/joanzapata/iconify/Iconify$IconifyInitializer;
.super Ljava/lang/Object;
.source "Iconify.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/joanzapata/iconify/Iconify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IconifyInitializer"
.end annotation


# direct methods
.method public constructor <init>(Lcom/joanzapata/iconify/IconFontDescriptor;)V
    .registers 2
    .param p1, "iconFontDescriptor"    # Lcom/joanzapata/iconify/IconFontDescriptor;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    # invokes: Lcom/joanzapata/iconify/Iconify;->addIconFontDescriptor(Lcom/joanzapata/iconify/IconFontDescriptor;)V
    invoke-static {p1}, Lcom/joanzapata/iconify/Iconify;->access$000(Lcom/joanzapata/iconify/IconFontDescriptor;)V

    .line 69
    return-void
.end method


# virtual methods
.method public with(Lcom/joanzapata/iconify/IconFontDescriptor;)Lcom/joanzapata/iconify/Iconify$IconifyInitializer;
    .registers 2
    .param p1, "iconFontDescriptor"    # Lcom/joanzapata/iconify/IconFontDescriptor;

    .prologue
    .line 77
    # invokes: Lcom/joanzapata/iconify/Iconify;->addIconFontDescriptor(Lcom/joanzapata/iconify/IconFontDescriptor;)V
    invoke-static {p1}, Lcom/joanzapata/iconify/Iconify;->access$000(Lcom/joanzapata/iconify/IconFontDescriptor;)V

    .line 78
    return-object p0
.end method
