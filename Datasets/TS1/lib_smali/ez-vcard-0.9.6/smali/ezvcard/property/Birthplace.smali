.class public Lezvcard/property/Birthplace;
.super Lezvcard/property/PlaceProperty;
.source "Birthplace.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 97
    invoke-direct {p0}, Lezvcard/property/PlaceProperty;-><init>()V

    .line 98
    return-void
.end method

.method public constructor <init>(DD)V
    .registers 5
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 106
    invoke-direct {p0, p1, p2, p3, p4}, Lezvcard/property/PlaceProperty;-><init>(DD)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lezvcard/property/PlaceProperty;-><init>(Ljava/lang/String;)V

    .line 115
    return-void
.end method
