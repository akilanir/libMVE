.class public Lcom/drew/metadata/Schema;
.super Ljava/lang/Object;
.source "Schema.java"


# static fields
.field public static final DUBLIN_CORE_SPECIFIC_PROPERTIES:Ljava/lang/String; = "http://purl.org/dc/elements/1.1/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final EXIF_ADDITIONAL_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/exif/1.0/aux/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final EXIF_SPECIFIC_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/exif/1.0/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final EXIF_TIFF_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/tiff/1.0/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final XMP_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/xap/1.0/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
