state("Rising Dusk")
{
    int scene : 0x846D1C, 0x40;
}

start
{
    return old.scene == 86 && current.scene == 85;
}

split
{
    // Split when entering overworld
    if (old.scene != 24 && current.scene == 24)
    {
        return true;
    }
    // Split when Odokuro is defeated
    // if (old.scene != 101 && current.scene == 101)
    // {
    //     return true;
    // }
}