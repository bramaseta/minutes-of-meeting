part of '../pages.dart';

class DetailPayroll extends StatelessWidget {
  final PayrollData item;
  DetailPayroll({Key? key, required this.item}) : super(key: key);
  final _controllerPage = Get.put(DetailPayrollController());
  final GlobalKey imageKey = GlobalKey();
   String imagePath = '';

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              // onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => const AuthOption()),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 14,
                ),
              )),
          const SizedBox(width: 10),
          Text(
            titlePage,
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget listView1(BuildContext context) {
    
    return RepaintBoundary(
      key: imageKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 15),
          Container(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      listView2(context),
                      const SizedBox(height: 20),
                      listView3(context),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 180,
                  left: -20,
                  child: CircleAvatar(backgroundColor: Color(0xff20265B), radius: 15),
                ),
                Positioned(
                  bottom: 180,
                  right: -20,
                  child: CircleAvatar(backgroundColor: Color(0xff20265B), radius: 15),
                ),
                Positioned(
                  bottom: 185,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(color: Color(0xff20265B)),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget listView2(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/bg_tiket.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: "#fff".toColor(),
                    ),
                    child: Center(child: Icon(MdiIcons.scriptText, color: mainColor, size: 30))),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                   PRO(context).selectedCategory == "English" 
                    ? "Payroll Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "薪资详情"
                        : "Detail Gaji"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    PRO(context).selectedCategory == "English" 
                    ? 'Month : ${DateFormat('MMMM').format(DateTime.parse(item.date.toString().split(' ')[0]))}'
                    : (PRO(context).selectedCategory == "Chinese"
                        ? '月份 : ${DateFormat('MMMM').format(DateTime.parse(item.date.toString().split(' ')[0]))}'
                        : 'Bulan : ${DateFormat('MMMM').format(DateTime.parse(item.date.toString().split(' ')[0]))}'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    item.user?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    item.user?.personGroup ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listView3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      PRO(context).selectedCategory == "English" 
                    ? "Payroll Print Date" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "工资打印日期"
                        : "Tanggal Cetak Gaji"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    child: Text(
                      formatDateDDMMMMYY(item.date.toString().split(' ')[0]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Paid Leave" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "请假"
                        : "Izin"),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: "#696cff".toColor()),
                          ),
                          SizedBox(width: 5),
                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Sick : ${item.sick ?? '-'}"
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "Sick : ${item.sick ?? '-'}"
                                : "Sakit :  ${item.sick ?? '-'}"),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                          ),
                        ]),
                        const SizedBox(height: 5),
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: "#71dd37".toColor()),
                          ),
                          SizedBox(width: 5),
                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Unpaid Leave : ${item.unpaidLeave ?? '-'}"
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "Unpaid Leave : ${item.unpaidLeave ?? '-'}"
                                : "Unpaid Leave : ${item.unpaidLeave ?? '-'}"),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: "#03c3ec".toColor()),
                          ),
                          SizedBox(width: 5),
                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Annual Leave : ${item.annualLeave ?? '-'}"
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "Annual Leave : ${item.annualLeave ?? '-'}"
                                : "Annual Leave : ${item.annualLeave ?? '-'}"),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                          ),
                        ]),
                        const SizedBox(height: 5),
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.red),
                          ),
                          SizedBox(width: 5),
                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Alpha :  ${item.alpha ?? '-'}"
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "Alpha :  ${item.alpha ?? '-'}"
                                : "Alpha :  ${item.alpha ?? '-'}"),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      PRO(context).selectedCategory == "English" 
                    ? "Total of attendance" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "总出席人数"
                        : "Jumlah kehadiran"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: "#e7e7ff".toColor()),
                    child: Text(
                      item.totKerja ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      PRO(context).selectedCategory == "English" 
                      ? "Tot. of division's working days" 
                      : (PRO(context).selectedCategory == "Chinese"
                          ? "部门工作日数"
                          : "Jum. hari kerja divisi"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: "#e7e7ff".toColor()),
                    child: Text(
                      item.totHari ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: Text(
            PRO(context).selectedCategory == "English" 
                    ? "Wages" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "薪资"
                        : "Upah"),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Basic Salary" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "底薪"
                        : "Gaji Pokok"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.gaji ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Allowance 2 (KPI)" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "津贴二（KPI)"
                        : "Tunjangan 2 (KPI)"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.t2 ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Allowance 3" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "津贴三"
                        : "Tunjangan 3"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.t3 ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Overtime Wages" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "加班费"
                        : "Upah Lembur"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.lembur ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Bonus, THR" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "奖金, 13薪"
                        : "Bonus, THR"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.thr ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Other Allowance" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "其他福利"
                        : "Tunjangan lain-lain"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.reward ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        Divider(color: mainColor),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Sub Total (1)" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "小计 (1)"
                        : "Sub Total (1)"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: "#e7e7ff".toColor()),
            child: Text(
              item.total1 ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 20),
        SizedBox(
          child: Text(
            PRO(context).selectedCategory == "English" 
                    ? "Deduction" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "扣除"
                        : "Deduction"),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              'BPJS TK 2%',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.bpjsTk ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              'JP 1%',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.jp ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              'BPJS Kes 1%',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.bpjsKes ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Lateness" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "迟到"
                        : "Keterlambatan"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.lateness ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Penalty (Alpha)" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "迟到"
                        : "Penalty (Alpha)"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.penalty ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Natura" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "福利"
                        : "Natura"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.natura ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Other" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "其他"
                        : "Lain - lain"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.dedOth ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        Divider(color: mainColor),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Sub Total (2)" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "小计 (2)"
                        : "Sub Total (2)"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: "#e7e7ff".toColor()),
            child: Text(
              item.total2 ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 45),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "Sub Total (1) - (2)" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "小计 (1) - (2)"
                        : "Sub Total (1) - (2)"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: "#e8fadf".toColor()),
            child: Text(
              item.subTotal ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Text(
              PRO(context).selectedCategory == "English" 
                    ? "PPH 21" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "所得税 21"
                        : "PPH 21"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            child: Text(
              item.pph ?? 'Rp. 0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        const SizedBox(height: 30),
        SizedBox(
          child: Text(
            PRO(context).selectedCategory == "English" 
                    ? "GRAND TOTAL (Sub Total - PPH)" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "共计 （小计 - 所得税）"
                        : "GRAND TOTAL (Sub Total - PPH)"),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
          ),
        ),
        Center(
          child: Text(
            item.grandTotal ?? 'Rp. 0',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: mainColor, fontWeight: FontWeight.w600, fontSize: 40),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
                    ? "Payroll Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "薪资详情"
                        : "Detail Gaji"),
      home: Scaffold(
        backgroundColor: Color(0xff20265B),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
                    ? "Payroll Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "薪资详情"
                        : "Detail Gaji"),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.download), // Icon for the action button
              onPressed: () => _captureAndSaveImage(context, imageKey),
            ),
            // IconButton(
            //   icon: Icon(Icons.share),
            //   onPressed: () => _shareImage(),
            // ),
          ],
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<DetailPayrollController>(
          builder: (_) {
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    listView1(context),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 16,
                                child: Container(
                                    height: 200,
                                    padding: const EdgeInsets.all(defaultMargin),
                                    child: Column(children: [
                                      Text(
                                        PRO(context).selectedCategory == "English" 
                                        ? "Confirm your salary" 
                                        : (PRO(context).selectedCategory == "Chinese"
                                            ? "确认您的工资"
                                            : "Konfirmasi gaji anda"),
                                         style: blackFontStyle2),
                                      const SizedBox(height: 10),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        ElevatedButton(
                                            onPressed: () async => await _controllerPage.submit(context, item), child: SizedBox(width: double.infinity, child: Center(child: 
                                            Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "Yes" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "是"
                                                  : "Iya"),
                                            )))),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              side: MaterialStateProperty.all(BorderSide(color: mainColor)),
                                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                                              overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 114, 147, 255)),
                                            ),
                                            child: SizedBox(width: double.infinity, child: Center(child: Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "No" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "否"
                                                  : "Tidak"),
                                              style: blackFontStyle3.copyWith(color: Colors.black))))),
                                      ])
                                    ])),
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(145, 52)),
                          backgroundColor: MaterialStateProperty.all(mainColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        child: Text(
                          PRO(context).selectedCategory == "English" 
                          ? "Confirm" 
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "确认"
                              : "Konfirmasi"),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _captureAndSaveImage(BuildContext context, GlobalKey imageKey) async {
    try {
      RenderRepaintBoundary boundary = imageKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: MediaQuery.of(context).devicePixelRatio);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List uint8List = byteData!.buffer.asUint8List();
      
      String fileName = 'Gaji_Bulan_${DateFormat('MMMM').format(DateTime.parse(item.date.toString().split(' ')[0]))}.png';

      final result = await ImageGallerySaver.saveImage(uint8List, name: fileName);
      imagePath = result['filePath']; // Set the imagePath here

      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
              ? "Payroll slip downloaded successfully" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "工资条下载成功"
                  : "Slip gaji berhasil diunduh"),
      );
      print('Image saved to gallery: $result');
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  void _shareImage() async {
  try {
    if (imagePath.isNotEmpty) { // Check if imagePath is not empty
      // You can customize the share subject and message.
      String shareSubject = "Payroll Slip";
      String shareMessage = "Check out this image I downloaded from MyApp!";

      await FlutterShare.shareFile(
        title: shareSubject,
        text: shareMessage,
        filePath: imagePath,
      );
    } else {
      print('Image path is empty. Image not found.');
    }
  } catch (e) {
    print('Error sharing image: $e');
  }
}

}
