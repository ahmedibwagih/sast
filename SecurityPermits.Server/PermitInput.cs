namespace SecurityPermits.Server
{
    public class PermitInput
    {
        public long? ID { get; set; }

        public DateTime PermitFrom { get; set; }

        public DateTime PermitTo { get; set; }

        public int? Branch_ID { get; set; }
        public int? Department_ID { get; set; }
        public int? DepartmentSectionID { get; set; }

        public string? ContractorName { get; set; }
        /// <summary>
        /// الشركة
        /// </summary>
        public string? CompanyName { get; set; }
        public int? EntryEmpNumber { get; set; }

        public required int? Status { get; set; }
    }
}
